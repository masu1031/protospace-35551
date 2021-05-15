class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end    
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end
  
  def edit
    unless @prototype.user == current_user
      redirect_to action: :index
    end
  end
  
  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)
    unless prototype.update(prototype_params)
      redirect_to edit_prototype_path
    else
      redirect_to root_path
    end
  end

  def destroy    
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image, :user).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

end

