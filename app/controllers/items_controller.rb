class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def new
    @item = Item.new
  end

  def show
  end

  def index
    @items = Item.all
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to @item
    else
      flash[:error] = "There was an error. Please try again."
      render :new
    end
  end

  def update
    if @item.update_attributes(item_params)
      flash[:notice] = "Item was updated."
      redirect_to @item
    else
      flash[:error] = "There was an error. Please try again."
      render :new
    end
  end

  def destroy
    if @item.destroy
      flash[:notice] = "Item was deleted."
      redirect_to items_path
    else
      flash[:error] = "Item was not deleted. Please try again."
      render @item
    end
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :price, :cost, :brand, :category_id, :avatar)
    end
end
