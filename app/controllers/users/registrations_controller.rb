class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @creative_bots_title = "ものづくり"
    @creative_bots = Bot.where(situation:"ものづくり").shuffle[0..9]
    @life_bots_title = "日常生活"
    @life_bots = Bot.where(situation:"日常生活").shuffle[0..9]
    @neta_bots_title = "ネタ"
    @neta_bots = Bot.where(situation:"ネタ").shuffle[0..9]
    @etc_bots_title = "その他"
    @etc_bots = Bot.where(situation:"その他").shuffle[0..9]
    super
  end

  # ユーザー登録した直後のリダイレクト先を指定
  def after_sign_up_path_for(resource)
    "/#{current_user.nickname}"
  end

  # ログイン後のリダイレクト先を指定
  def after_sign_in_path_for(resource)
    "/#{current_user.nickname}"
  end

end

