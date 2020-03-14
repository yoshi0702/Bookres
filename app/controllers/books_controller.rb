class BooksController < ApplicationController

  def top

  end

  def index
    @book = Book.new
    @books = Book.all

  end

  def show
  	@book = Book.find(params[:id])


  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
 	if @book.save
  		flash[:notice] = "Book was successfully created."
  		redirect_to book_path(@book)
  	else
  		@books = Book.all
  		render :index
    end

  end

  def edit
  	@book = Book.find(params[:id])


  end

  def update
  	@book = Book.find(params[:id])
  	@book.update(book_params)
  	flash[:notice] = "Book was successfully updated"
  	redirect_to book_path(@book)


  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path

  end

   private
    def book_params
      params.require(:book).permit(:title, :category, :body)
    end

end

