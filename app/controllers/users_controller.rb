class UsersController < ApplicationController

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def create
    @book = Book.new(book_params[:id])
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render 'show'
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render 'edit'
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
