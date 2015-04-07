require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	test "an item should have a title" do
		item = Item.new
		item.description = "Creamy"
		item.price = 4.50

		assert_not item.save, "Tried to save an item without a title"
	end

	test "an item should have a description" do
		item = Item.new
		item.title = "Icecream"
		item.price = 4.50

		assert_not item.save, "Tried to save an item without a description"
	end

	test "an item should have a price" do
		item = Item.new
		item.title = "Milk"
		item.description = "Tasty"

		assert_not item.save, "Tried to save an item without a description"
	end

	test "an item should belong to at least one category" do
		item = Item.new
		item.title = "Pizza"
		item.description = "Hot"
		item.price = 4.30

		assert_not item.save, "Item does not belong to a category"
		assert_not item.errors[:category_ids].empty?, "Item does not belong to at least one category"
	end

	test "an item cannot have an empty description and/or title" do
		item = Item.new
		item.title = ""
		item.description = ""
		item.price = 3.50
		item.categories << categories(:one)

		assert_not item.valid?, "Item has an empty title or description"
	end

	test "an item must have a unique title" do
		item = Item.new
		item.title = "Chicken"
		item.description = "Crispy"
		item.price = 4.80
		item.categories << categories(:one)

		assert_not item.valid?, "Item does not have a unique title"
	end

	test "an item's price must be a unique decimal numeric value greater than zero" do
		item = Item.new
		item.title = "Coffee"
		item.description = "Smooth"
		item.price = -1.8
		item.categories << categories(:one)

		assert_not item.valid?, "Item does not have a valid price"
	end

end
