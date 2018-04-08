class RoomsController < ApplicationController
  

  before_action :set_room, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]



  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
          redirect_to @room, notice: "Annonce ajoutée avec succès..."
    else
      render :new, alert: "Votre annonce n'à pas pu être ajoutée..."
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def index
    @rooms = current_user.rooms
  end

  def edit
  end

  def update
    @room.update(room_params)
    if @room.update
      redirect_to @room, notice: "votre annonce à été modifiée avec succés..."
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
    @room = current_user.rooms.find(params[:id])
  end

  def room_params
 
      params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room, 
                                   :listing_name, :summary, :address, :is_wifi, :is_tv, :is_closet, 
                                   :is_shampoo, :is_breakfast, :is_heating, :is_air, :is_kitchen, :price, 
                                   :active)
  end

end
