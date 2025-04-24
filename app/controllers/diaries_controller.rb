class DiariesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user = current_user

    if @diary.save
      redirect_to diaries_path
    else
      render :new
    end
  end

  def index
    @diaries = Diary.order(created_at: :desc)
    @diaries = Diary.all
  end

  def show
    @diary = Diary.find(params[:id])
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :image, :text)
  end
end
