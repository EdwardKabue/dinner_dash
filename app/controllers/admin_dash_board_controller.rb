class AdminDashBoardController < ApplicationController
	before_action :set_order, only: [:show, :mark_as_completed, :mark_as_paid, :cancel]
	before_action :redirect_if_not_admin
	def index
		@paid_orders = Order.where(paid: true)
		@completed_orders = Order.where(completed: true)
		@cancelled_orders = Order.where(cancelled: true)
		@ordered_orders = Order.where(ordered: true)
	end

	def show
		@order_items = @order.line_items	
	end

	#Custom actions for an order

	def mark_as_completed
	   @order.update_attributes(:completed_at => Time.now, :completed => true)
	   flash[:notice] = "This order has been completed."
	   redirect_to admin_dash_board_path(@order)
	end

	def cancel
	   @order.update_attributes(:cancelled_at => Time.now, :cancelled => true)
	   flash[:notice] = "This order has been cancelled."
	   redirect_to admin_dash_board_path(@order)
	end 

	def mark_as_paid
	   @order.update(:paid => true)
	   flash[:notice] = "This order has been paid for."
	   redirect_to admin_dash_board_path(@order)
    end

	private
	
	def set_order
	   @order = Order.find(params[:id])
	end
end
