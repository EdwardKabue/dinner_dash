class ItemsController < ApplicationController
  include CurrentCart
  before_action :set_item, only: [:show, :edit, :update, :destroy, :remove_from_category]
  before_action :redirect_if_not_admin, only: [:new, :edit, :update, :create, :retire, :destroy]
  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
      @item.destroy
      respond_to do |format|
        format.html { redirect_to items_url }
        format.json { head :no_content }
      end
  end

  #Custom action for retiring an item
  def retire
    @item = Item.find(params[:item_id])
    @item.update(:retired => true)
    flash[:notice] = "This item has been retired."
    redirect_to @item
  end

  def remove_from_category
    categories = []
    removed_category_ids = params[:item][:category_ids]

    removed_category_ids.each do |id|
      categories << Category.find(id)
    end

    @item.categories.delete(categories)
    redirect_to @item
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :description, :price, :photo, category_ids: [])
    end
end
