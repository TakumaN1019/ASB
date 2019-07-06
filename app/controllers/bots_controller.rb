class BotsController < ApplicationController
  before_action :set_bot, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy] # 管理者または投稿者でなければリダイレクトではじく

  def index
    @title = "Boooot"
    @bots = Bot.all.shuffle[0..49]
  end

  def show
    @selects_json = @bot.selects.to_json.html_safe
    @url = request.url

    @creative_bots_title = "ものづくり"
    @creative_bots = Bot.where(situation:"ものづくり").shuffle[0..9]
    @life_bots_title = "日常生活"
    @life_bots = Bot.where(situation:"日常生活").shuffle[0..9]
    @neta_bots_title = "ネタ"
    @neta_bots = Bot.where(situation:"ネタ").shuffle[0..9]
    @etc_bots_title = "その他"
    @etc_bots = Bot.where(situation:"その他").shuffle[0..9]
  end

  def new
    @bot = Bot.new
    @bot.selects.build
    @title = "CREATE BOT"
  end

  def edit
    @title = "EDIT BOT"
  end

  def create
    @bot = Bot.new(bot_params)
    @bot.user_id = current_user.id

    if @bot.save
      # selectの空の要素は削除
      @bot.selects.each do |select|
        if not select.name.present?
          brank_select = Select.find(select.id)
          brank_select.destroy
        end
      end
      flash[:success] = "CREATE"
      redirect_to @bot
    else
      render :new
    end
  end

  def update
    if @bot.update(bot_params)
      # selectの空の要素は削除
      @bot.selects.each do |select|
        if not select.name.present?
          brank_select = Select.find(select.id)
          brank_select.destroy
        end
      end
      flash[:success] = "UPDATE"
      redirect_to @bot
    else
      render :edit
    end
  end

  def destroy
    @bot.destroy
    flash[:success] = "DELETE"
    redirect_to user_path(@bot.user.nickname)
  end

  private
    def set_bot
      @bot = Bot.find(params[:id])
    end

    def bot_params
      params.require(:bot).permit(:title, :situation, :user_id, selects_attributes: [:id, :_destroy, :name])
    end

    # 管理者または投稿者でない場合はリダイレクトではじく
    def ensure_correct_user
      @bot = Bot.find(params[:id])
      if not current_user.nickname == "TakumaN_me"
        if not current_user.id == @bot.user.id
          redirect_to user_path(current_user.nickname)
        end
      end
    end

end
