class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def deny!(message = "Acesso negado.")
    flash[:notice] = message    
    redirect_to root_path 
  end
  
  def collect_page
    @page = params[:page] || 1
  end

end
