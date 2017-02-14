class Api::V1::LinksController < ApiController

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      render json: @link, status: 200
    else
      render status: 500
    end
  end

  private

  def link_params
      params.require(:link).permit(:url, :title, :read)
  end
end
