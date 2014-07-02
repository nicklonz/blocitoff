class ItemsController < ApplicationController
  
  def create
    # save the item
    # redirect to the list  show
    
    @list = List.find(params[:list_id])
  
    @items = @list.items

    @item = current_user.items.build( item_params )
    @item.list = @list
    @new_item = Item.new  

  if @item.save
      flash[:notice] = "Item was created."
    else
      flash[:error] = "There was an error saving the item. Please try again."
    end

    respond_with(@item) do |f|
      f.html { redirect_to [@list] }
    end
  end

  def destroy
    #destroy the item
    #redirect to the list show

    if @item.destroy
      flash[:notice] = "Item was removed."
    else
      flash[:error] = "Item couldn't be deleted. Try again."
    end

    respond_with(@item) do |f|
      f.html { redirect_to [@list] }
    end
  end
end
