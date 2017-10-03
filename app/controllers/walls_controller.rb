class WallsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wall, only: [:edit, :update, :destroy]

  def index
    @walls = Wall.all.order(:created_at).reverse_order
  end

  def new
    if params[:back]
      @wall = Wall.new(walls_params)
    else
      @wall = Wall.new
    end
  end

  def create
    #pictureは存在しているがパスのみ
    @wall = Wall.new(walls_params)
    @wall.user_id = current_user.id
    if @wall.save #ココでfalseが返されるためにエラー画面に遷移する
      redirect_to walls_path, notice: "投稿しました！"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @wall.update(walls_params)
    redirect_to walls_path, notice:"更新しました！"
  end

  def destroy
    @wall.destroy
    redirect_to walls_path, notice: "写真を削除しました！"
  end

=begin
  def confirm
    #paramsにpictureキーと添付ファイルが存在している
    @wall = Wall.new(walls_params)
    #paramsにはwall=>titleのみでpictureキーすら存在しない（添付ファイルも存在しない）
    render :new if @wall.invalid?
  end
=end

  private
    def walls_params
      params.require(:wall).permit(:title, :content, :picture)
    end

    def set_wall
      @wall = Wall.find(params[:id])
    end

end
