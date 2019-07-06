class UsersController < ApplicationController

  before_action :set_user, only: [:show]

  def show
    @my_bots_title = ""
    @my_bots = Bot.where(user_id:@user.id).order(updated_at: :desc)
  end

  private
    def set_user
      @user = User.find_by(nickname: params[:nickname])
    end

end
