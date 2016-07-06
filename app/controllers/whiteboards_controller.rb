class WhiteboardsController < ApplicationController

  def update
    whiteboard = Whiteboard.find(params['id'])
    whiteboard.update_attributes content: params['content']
  end

  def run
    whiteboard = Whiteboard.find(params['whiteboard_id'])
    result = whiteboard.run
    whiteboard.output << "\n" << result.to_s
    whiteboard.save
    respond_to do |format|
      format.json{ render json: {return: whiteboard.output}}
    end
  end

  def clear
    whiteboard = Whiteboard.find(params['whiteboard_id'])
    whiteboard.update_attributes output: ''
  end

end
