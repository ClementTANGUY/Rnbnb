class RoomsController < ApplicationController


  before_action :set_room, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def new
    @room = current_user.rooms.new
  end

  def create
    @room = current_user.rooms.new(room_params)
    @room.save
    if @room.save
      if params[:images]
        params[:images].each do |i|
          @room.photos.create(image: i)
        end
      end
      @photos = @room.photos
      redirect_to edit_room_path(@room), notice: "Annonce ajoutée avec succès..."
    else
      render :new, alert: "Votre annonce n'à pas pu être ajoutée..."
    end
  end

  def show
    @room = Room.find(params[:id])
    @photos = @room.photos
  end

  def index
    @rooms = current_user.rooms
  end

  def edit
    @photos = @room.photos
  end

  def update
    @room.update(room_params)
    if @room.update(room_params)
      if params[:images]
        params[:images].each do |i|
          @room.photos.create(image: i)
        end
      end
      @photos = @room.photos
      redirect_to edit_room_path(@room), notice: "votre annonce à été modifiée avec succés..."
    else
      render :edit, alert: "votre annonce n'a pas pu être modifiée..."
    end
  end

  def destroy
    @room.destroy
    if @room.destroy
      redirect_to :index, notice: "votre annonce à bien été suprimmée..."
    else
      render @room, alert: "problème lors de la spression de votre annonce..."
    end
  end


  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params

      params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room,
                                   :listing_name, :summary, :address, :is_wifi, :is_tv, :is_closet,
                                   :is_shampoo, :is_breakfast, :is_heating, :is_air, :is_kitchen, :price,
                                   :active)
  end

  def require_same_user
    if current_user.id != @room.user_id
      redirect_to root_path, alert: "Vous ne pouvez pas modifier cette page..."
    end
  end

end
