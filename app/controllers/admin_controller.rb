class AdminController < ApplicationController
   def index
     #flash[:notice] ="user #{@user.id}
     redirect_to users_path #@total_orders = Order.count
   end

end
  
