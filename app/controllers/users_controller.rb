class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :current_user!, :only => [:lended, :lent]
  before_filter :collect_page
  
  def books
    @books = User.find(params[:id]).books.page(@page)
  end

  def lended
    @books = current_user.books.lent.page(@page)
  end

  def lent
    @books = current_user.loans.page(@page)
  end

  private 
    def current_user!
      deny! unless current_user.id.to_s == params[:id]
    end
end
