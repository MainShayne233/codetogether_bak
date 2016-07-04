class WhiteboardsController < ApplicationController

  def update
    whiteboard = Whiteboard.find(params['id'])
    whiteboard.update_attributes content: params['content']
  end

end