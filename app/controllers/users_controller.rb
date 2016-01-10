class UsersController < ApplicationController
     before_action :authenticate_user! 
     
    def index
       @users = User.all
       
    end
        
    def show
       @user = User.find( params[:id]) #:id because this was indicated in the path in rake routes info. 
    end
    
end