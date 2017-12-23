class TagsController < ApplicationController

  before_action :require_sign_in, except: [:index]

  def index
    @tags = Tag.all
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:notice] = "The new tag was created."
      redirect_to tags_path
    else
      render 'new'
    end
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update(tag_params)
      flash[:notice] = "The tag was updated!"
      redirect_to tags_path
    else
      render 'edit'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
