class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
    @title = @room.title
    @description = @room.description
    @beds =  @room.beds
    @guests =  @room.guests
    @image_url =  @room.image_url
  end

def update
  @title = params[:room][:title]
  @description = params[:room][:description]
  @beds = params[:room][:beds]
  @guests = params[:room][:guests]
  @image_url = params[:room][:image_url]
  if @room.save
    redirect_to rooms_path
  else
    render "edit"
  end

end

  protected
    def room_params
      params.require(:room).permit(:title, :description, :beds, :guests, :image_url)
    end
end
