class BooksController < ApplicationController
  def index
     @books = Book.all
  end
  def new
     @books = Book.new
  end

  def show
     @book = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:success] = "Book was successfully created."
      redirect_to books_path

  end
end
  def edit
    @book = Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])

     if book.update(book_paramss)
      flash[:success] = "Book was successfully updated."

        redirect_to book_path(book.id)
     else

       render 'index'
  end
end
  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:success] = "Book was successfully destroyed."
    redirect_to books_path
   end
  end

  private


  def book_params
    params.permit(:title, :body)
  end
  def book_paramss
    params.require(:book).permit(:title, :body)
  end
end
