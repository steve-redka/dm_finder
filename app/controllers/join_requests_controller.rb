class JoinRequestsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @game = Game.find(params[:game_id])
      @join_request = @game.join_requests.build(join_request_params)
      @join_request.user = current_user
  
      if @join_request.save
        redirect_to @game, notice: 'Join request submitted successfully.'
      else
        flash.now[:alert] = @join_request.errors.full_messages.to_sentence
        render 'games/show'
      end
    end

    def accept
        @join_request = JoinRequest.find(params[:id])
        @join_request.update(status: 'accepted')
        @game = @join_request.game
        @game.users << @join_request.user unless @game.users.include?(@join_request.user)
        redirect_to @game, notice: 'Join request accepted successfully.'
        # render 'games/show', alert: 'Join request rejected successfully.'
    end

    def reject
        @join_request = JoinRequest.find(params[:id])
        @join_request.update(status: 'rejected')
        @game = @join_request.game
        redirect_to @game, notice: 'Join request rejected successfully.'
        # render 'games/show', alert: 'Join request rejected successfully.'
    end
  
    private
  
    def join_request_params
      params.require(:join_request).permit(:message)
    end
  end