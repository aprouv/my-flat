class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    #include fourniture index and new
    @room = Room.find(params[:id])
    @fourniture = Fourniture.new
    @fournitures = @room.fournitures
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name, :banner_url)
  end

end
