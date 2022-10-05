class BooksController < ApplicationController

  before_action :find_book, only: %i[show update delete destroy]

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

  def show
    render json: {status: 'SUCCESS', message: 'Book is loaded', data: @book}, status: :ok
  end

  def update
    if @book.update(book_params)
      render json: {status: 'SUCCESS', message: 'Book is updated', data: @book}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Book failed to update', data: @book.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    render json: {status: 'SUCCESS', message: 'Book is deleted.', data: @book}, status: :ok
  end

  private

  def book_params
    params.permit(:title, :author)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
