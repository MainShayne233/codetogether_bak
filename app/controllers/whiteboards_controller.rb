class WhiteboardsController < ApplicationController

  def update
    whiteboard = Whiteboard.find(params['id'])
    if params['content'].profane?
      current_user.destroy
      whiteboard.update_attributes content: params['content'][0..-10]
      flash[:alert] = 'Bye bye account. Come back when you can watch your language.'
      redirect_to new_user_registration_path
    else
      whiteboard.update_attributes content: params['content']
    end
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