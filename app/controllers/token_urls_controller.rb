class TokenUrlsController < ApplicationController
  def new
    @token_url = TokenUrl.new
  end
  
  def create
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
end
