class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart , only: [:create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :is_user_signed_in?, only: [:create]

  # GET /orders
  # GET /orders.json
  def index
    if current_user.admin
      @orders = Order.all
     else 
      @orders = current_user.orders.all
    end  
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order_items = @order.line_items.all
    @total_order_price = 0
    @order_items.each do |order_item|
      @total_order_price += order_item.quantity * order_item.item.price
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = @cart.line_items.order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  #Custom actions for the completion and cancellation of an order

  def complete
    if @order.ordered && @order.paid
      @order.update_attributes(:completed_at => Time.now, :completed => true)
      redirect_to @order
    else 
      redirect_to @order
    end  
  end

  def cancel
    if @order.completed
      redirect_to @order
    else  
      @order.update_attributes(:cancelled_at => TIme.mow, :cancelled => true)
      redirect_to @order
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params[:order]
    end
end
