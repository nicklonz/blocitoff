class ItemsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @item = Item.new(item_params)
    @item.list = @list
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Item was created."
    else
      flash[:error] = "There was an error saving the item. Please try again."
    end

    redirect_to @list
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was removed."
    else
      flash[:error] = "Item couldn't be deleted. Try again."
    end

    redirect_to @list
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
