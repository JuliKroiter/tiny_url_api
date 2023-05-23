class TinyUrlsController < ApplicationController
  before_action :find_tiny_url, only: %i[show stats]

  def create
    render json: ::TinyUrls::CreateService.new(tiny_url_params[:url]).call
  end

  def show
    render json: ::TinyUrls::ShowService.new(@tiny_url).call
  end

  def stats
    render json: { clicked: @tiny_url.clicked }
  end

  private

  def find_tiny_url
    @tiny_url = TinyUrl.find_by(short_url: params[:id])

    render json: { errors: "Url #{params[:id]} not found" }, status: :not_found unless @tiny_url
  end

  def tiny_url_params
    params.require(:tiny_url).permit(:url, :short_url)
  end
end
