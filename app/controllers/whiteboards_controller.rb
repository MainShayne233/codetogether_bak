class WhiteboardsController < ApplicationController

  def update
    whiteboard = Whiteboard.find(params['id'])
    whiteboard.update_attributes content: params['content']
  end

  def run
    whiteboard = Whiteboard.find(params['whiteboard_id'])
    puts whiteboard.run
    respond_to do |format|
      format.json{ render json: {return: whiteboard.run}}
    end
  end

end