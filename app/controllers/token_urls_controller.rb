class TokenUrlsController < ApplicationController
  before_action :set_token_url, only: [:show, :index]

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
    if @token_url
      @token_url.internet_protocols.create(address: request.remote_ip)
      redirect_to @token_url.url
    else
      redirect_to root_url, flash: { error: "Token do not exist" } 
    end
  end
  
  def index
    if @token_url
      @ip_addresses = @token_url.internet_protocols
    else
      redirect_to root_url, flash: { error: "Token do not exist" } 
    end
  end

  private

  def set_token_url
    @token_url = TokenUrl.find_by(token: params[:token])
  end

  def token_url_params
    params[:token_url].permit(
      :url
    )
  end

  def token_url
    Rails.application.routes.url_helpers.token_urls_redirects_url(token: @token_url.token) if @token_url
  end
end
