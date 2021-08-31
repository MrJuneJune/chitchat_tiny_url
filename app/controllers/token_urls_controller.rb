class TokenUrlsController < ApplicationController
  def new
    @token_url = TokenUrl.new
  end
  
  def create
    @token_url = TokenUrl.find_or_create_by(token_url_params)
    render json: { new_url: token_url }
  rescue => e
    render json: { error: e }, status: 400
  end

  def show
  end
  
  def index
  end

  private

  def token_url_params
    params[:token_url].permit(
      :url
    )
  end

  def token_url
    Rails.application.routes.url_helpers.token_urls_redirects_url(token: @token_url.token) if @token_url
  end
end
