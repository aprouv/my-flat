class FournituresController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @fourniture = Fourniture.new(fourniture_params)
    @fourniture.room = @room
    if @fourniture.save
      redirect_to room_path(@room)
    else
      render 'rooms/show'
    end
  end

  def destroy
    @fourniture = Fourniture.find(params[:id])
    @room = @fourniture.room
    @fourniture.destroy
    redirect_to room_path(@room)
  end

  private

  def fourniture_params
    params.require(:fourniture).permit(:name, :image_url)
  end
end
