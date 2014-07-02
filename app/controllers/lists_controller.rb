class ListsController < ApplicationController
  
  def create
  @list = List.new(params.require(:list).permit(:title))
  if @list.save
    flash[:notice] = "List was saved."
    redirect_to @list
  else
    flash[:error] = "There was an error saving your list. Please try again."
    render :new
  end
end

  def destroy
  end

  def index
    @lists = List.all
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
