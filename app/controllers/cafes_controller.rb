class CafesController < ApplicationController
  def index
    @items=Cafe.all
  end

  def show
    @item = Cafe.find(params[:id])
    @reviews = Post.where(cafe: @item).all

  end

  def search
    @keyword = params[:keyword]
    @cafe = Cafe.where("name LIKE ?", "%#{@keyword}%").all

  end

  def create
   lat = params[:lat]
   lng = params[:lng]
   address = params[:address]

   name = params[:name]
   description = params[:description]
   images = params[:images]

   item = Cafe.new
   item.user = current_user
   item.lat = lat
   item.lng = lng
   item.address = address
   item.name = name
   item.desc = description
   item.images = images
   item.save

   redirect_to cafes_path
  end

  def new
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def map
    minLat=params[:minLat]
    minLng=params[:minLng]
    maxLat=params[:maxLat]
    maxLng=params[:maxLng]

    @items=Cafe.where("lat >= ? AND lat <= ?", minLat, maxLat)
                      .where("lng >= ? AND lng <= ?", minLng, maxLng).all

    render layout: false
  end
end
