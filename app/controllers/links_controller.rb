class LinksController < ApplicationController
  def index
    @link = current_user.links.new() if current_user
    @links = current_user.links if current_user
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      flash[:success] = "Your link has saved"
      redirect_to root_path
    else
      flash[:danger] = "The link submitted was invalid"
      redirect_to root_path
    end
  end

  private
    def link_params
      params.require(:link).permit(:url, :title, :read)
    end
end
