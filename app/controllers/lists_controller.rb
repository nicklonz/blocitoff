class ListsController < ApplicationController
  def create
  end

  def destroy
  end

  def index
    @lists = List.all
  end

  def show
  end

  def new
  end
end
