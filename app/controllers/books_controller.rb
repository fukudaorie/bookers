class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end  
  end

  def show
    @list = List.find(params[:id]) 
  end

  def edit
    @list = List.find(params[:id])
  end
  
   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
