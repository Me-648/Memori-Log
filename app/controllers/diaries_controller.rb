class DiariesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_diary, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if params[:diary][:remove_image] == '1'
      @diary.image.purge
    end

    if @diary.update(diary_params.except(:remove_image))
      # redirect_to diaries_path(@diary)
      redirect_to diaries_path
    else
      render :edit
    end
  end

  def destroy
    @diary.destroy
    redirect_to diaries_path
  end

  private

  def set_diary
    @diary = Diary.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:title, :image, :text)
  end
end
