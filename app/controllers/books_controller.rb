class BooksController < UsersController
	 before_filter :find_book, only: [:show, :edit, :update, :destroy]
   before_filter :find_user

 
  def index
  	@books = Book.all
  end

  def show
  	# render :text => "in show"
  end
  
  def new
  	@book = Book.new
  end

  def create
   @book = Book.new(params[:book])
   @book.user = @user
   if @book.save
     redirect_to @user,notice: "Book created successfully!"
   else
    render :new
   end 	
  end

  def edit
  end
  
  def update
   if @book.update_attributes(params[:book])
     redirect_to @book,notice: "Book updateed successfully!"
   else
    render :new
   end 
  end

  def destroy
    if @book.destroy
    	redirect_to books_path, notice: "Book entry is destroyed"
    else
    	redirect_to books_path, notice: "Book entry deletion fails"
    end
  end

  private

	def find_book
	  @book = Book.find(params[:id])
	end

end
