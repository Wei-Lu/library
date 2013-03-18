class UsersController < ApplicationController
	 before_filter :find_user, only: [:show, :edit, :update, :destroy]
 
  def index
  	@users = User.all
  end

  def show
  	# render :text => "in show"
  end
  
  def new
  	@user = User.new
  end

  def create
   @user = User.new(params[:user])

   if @user.save
     redirect_to @user,notice: "user created successfully!"
   else
    render :new
   end 	
  end

  def edit
  end
  
  def update
   if @user.update_attributes(params[:user])
     redirect_to @user,notice: "user updateed successfully!"
   else
    render :new
   end 
  end

  def destroy
    if @user.destroy
    	redirect_to users_path, notice: "user entry is destroyed"
    else
    	redirect_to users_path, notice: "user entry deletion fails"
    end
  end

  private

	def find_user
	  @user = User.find(params[:id])
	end

end
