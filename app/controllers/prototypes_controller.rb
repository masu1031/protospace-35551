class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    Prototype.create(prototype_params)
    if Prototype.create
      redirect_to root_path
    else
      render :new
    end    
  end

  def show
    @prototype = Prototype.find(params[:id])
  end
  
  def edit
    @prototype = Prototype.find(params[:id])
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
end

