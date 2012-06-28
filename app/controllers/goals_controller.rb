class GoalsController < ApplicationController
  before_filter :authorize
  
  def index
    @user=User.find_by_id(session[:user_id])
 
  end

  def edit
    @user=User.find_by_id(session[:user_id])
  end
  
  def update
    @user = User.find params[:id]
    @user.update_attributes!(params[:user])
    flash[:notice] = "#{@user.name}, your goals were successfully updated."
    redirect_to goals_path
  end 
  
end
