class ProtospaceController < ApplicationController
  def index
  end

  def new
    @prototype = Protospace.new
  end

  def create    
    Prototype.create(Prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :edit
    end    
  end

  private

  def Prototype_params
    params.require(:message).permit(:content, :image).marge(user_id: current_user.id)
  end

end
