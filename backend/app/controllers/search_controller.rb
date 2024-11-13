class SearchController < ApplicationController
  def index
    if params[:query].present?
      @requests = Request.where("title LIKE ?", "%#{params[:query]}%")
    else
      @requests = Request.all
    end
  end

  def show
  end
end
