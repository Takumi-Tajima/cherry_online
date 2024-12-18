class BooksController < ApplicationController
  before_action :set_book, only: %i[show]

  def index
    @books = Book.default_order
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
