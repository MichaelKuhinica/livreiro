class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :current_user!, :only => [:lended, :lent]
  
  def books
    @books = User.find(params[:id]).books
  end

  def lended
    @books = current_user.books.lent
  end

  def lent
    @books = current_user.loans
  end

  private 
    def current_user!
      p(current_user)
      p(params[:id])
      deny! unless current_user.id.to_s == params[:id]
    end
end
