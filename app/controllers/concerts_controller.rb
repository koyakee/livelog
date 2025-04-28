class ConcertsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_concert, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]
  
  def index
    @concerts = current_user.concerts.order(date: :asc)
  end
  
  def show; end
  
  def new
    @concert = current_user.concerts.new
  end
  
  def create
    @concert = current_user.concerts.new(concert_params)
    if @concert.save
      redirect_to @concert, notice: "ライブ情報を登録しました"
    else
      render :new
    end
  end
  
  def edit; end
  
  def update
    if @concert.update(concert_params)
      redirect_to @concert, notice: "ライブ情報を更新しました"
    else
      render :edit
    end
  end
  
  def destroy
    @concert.destroy
    redirect_to concerts_path, notice: "ライブ情報を削除しました"
  end
  
  private
  
  def set_concert
    @concert = Concert.find(params[:id])
  end
  
  def authorize_user
    redirect_to concerts_path, alert: "権限がありません" unless @concert.user == current_user
  end
  
  def concert_params
    params.require(:concert).permit(:title, :status, :artist, :date, :venue, :memo, :setlist, :image)
  end
end
