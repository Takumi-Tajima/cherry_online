class Admins::BooksController < Admins::ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = Book.default_order
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to admins_book_path(@book), notice: 'Book was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      redirect_to admins_book_path(@book), notice: 'Book was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy!
    redirect_to admins_books_path, notice: 'Book was successfully destroyed.', status: :see_other
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(%i[title price released_on])
  end
end
