class ListsController < ApplicationController

  def create
    @list = current_user.lists.build(params.require(:list).permit(:title))
    if @list.save
      flash[:notice] = "List was saved."
      redirect_to @list
    else
      flash[:error] = "There was an error saving your list. Please try again."
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])

    if @list.destroy
      flash[:notice] = "List was removed."
    else
      flash[:error] = "List couldn't be deleted. Try again."
    end

    redirect_to lists_path
  end

  def index
    @lists = current_user.lists
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items
    @item = Item.new
  end

  def new
    @list = List.new
    authorize @list
  end
end
