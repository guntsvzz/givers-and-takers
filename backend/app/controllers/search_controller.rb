class SearchController < ApplicationController
  def index
    if params[:query].present?
      query = params[:query].downcase
      puts "Query: #{query}"
      @requests = Request.where("LOWER(title) LIKE ?", "%#{query}%")
    else
      @requests = Request.all
    end
  end

  def show
  end
end
