class CoderoomsController < ApplicationController

  def index
    @coderooms = Coderoom.all
  end

  def show
    @coderoom = Coderoom.find(params[:id])
  end

end