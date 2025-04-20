class ConcertsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_concert, only: %i[show edit update destroy]
  
  def index
    @concerts = current_user.concerts.order(date: :desc)
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
    @concert = current_user.concerts.find(params[:id])
  end
  
  def concert_params
    params.require(:concert).permit(:title, :artist, :date, :venue, :memo)
  end
end

