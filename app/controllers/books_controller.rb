class BooksController < ApplicationController
  def index
    @books = Book.order('created_at DESC')
    render json: {status: 'SUCCESS', message: 'Loaded books', data: @books}, status: :ok
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: {status: 'SUCCESS', message: 'Book is saved', data: @book}, status: :created
    else
      render json: {status: 'ERROR', message: 'Post is not saved', data: @book.errors}, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.permit(:title, :author)
  end
end
