class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy, :like]

  def index
    @contents = Content.order(created_at: :desc)
  end
  
  def show
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)

    if @content.save
      redirect_to contents_path, notice: "Content #{@content.title} was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @content.update(content_params)
      redirect_to @content, notice: "Content #{@content.title} was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @content.destroy

    redirect_to contents_path, notice: "Content #{@content.title} was successfully deleted."
  end

  def like
    @content.increment!(:like_count)

    @content.broadcast_replace_to(
      @content,
      target: "like_count_#{@content.id}",
      partial: "contents/like_count",
      locals: { content: @content }
    )

    head :no_content
  end

  private

  def set_content
    @content = Content.find(params[:id])
  end

  def content_params
    params.require(:content).permit(:title, :description, :video)
  end
end
