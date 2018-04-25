class AuthorsController < ApplicationController
  before_action :set_author, only: [:show]

  # GET /authors
  def index
    @authors = Author.all
  end

  # GET /authors/1
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_author
    @author = Author.find(params[:id])
  end
end
