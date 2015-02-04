class CategorisationsController < ApplicationController
	before_action :redirect_if_not_admin
	def create
		@category = Category.find(params[:category_id])
		@item = Item.find(params[:item_id])
		if @category.categorisations.find(params[:item_id])
			flash[:alert] = "This item is already in this category!"
			redirect_to @category
		else
			@categorisation = Categorisation.create(category_id: params[:category_id], item_id: params[:item_id] )
			flash[:notice] = "Item added"
			redirect_to @category
		end	
	end

	def destroy
		@categorisation = Categorisation.find(params[:id])
		@category = @categorisation.category
		@categorisation.destroy
		flash[:notice] = "Item has been removed."
		redirect_to @category
	end	
end
