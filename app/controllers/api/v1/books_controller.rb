module Api
  module V1
    class BooksController < ApplicationController
      before_action :find_book, only: %i[show update delete destroy]

      def index
        @books = Book.order("created_at DESC")
        render jsonapi: @books
      end

      def create
        @book = Book.new(book_params)

        if @book.save
          render jsonapi: @book
        else
          render jsonapi_errors: @book.errors
        end
      end

      def show
        render jsonapi: @book
      end

      def update
        if @book.update(book_params)
          render jsonapi: @book
        else
          render jsonapi_errors: @book.errors
        end
      end

      def destroy
        @book.destroy
        head :no_content
      end

      private

      def book_params
        params.permit(:title, :author)
      end

      def find_book
        @book = Book.find(params[:id])
      end
    end
  end
end
