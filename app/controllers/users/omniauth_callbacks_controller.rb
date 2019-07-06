class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    callback_from :twitter
  end

  private

    def callback_from(provider)
      provider = provider.to_s

      @user = User.find_for_oauth(request.env['omniauth.auth'])

      if @user.persisted?
        flash[:notice] = nil
        flash[:success] = "HELLO"
        sign_in(@user)
        redirect_to user_path(@user.nickname)
      else
        session["devise.#{provider}_data"] = request.env['omniauth.auth']
        redirect_to root_path
      end
    end

end

