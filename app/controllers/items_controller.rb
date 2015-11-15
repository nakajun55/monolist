class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]

  def new
      response = Amazon::Ecs.item_search(params[:q] , 
                                  :response_group => 'Medium' , 
                                  :country => 'jp')
      @amazon_items = response.items
  end

  def show
    @item = Item.find(params[:id])
    @wants = @item.want_users
    @haves = @item.have_users
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
