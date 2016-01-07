class UsersController < ApplicationController
    def show
       @user = User.find( params[:id]) #:id because this was indicated in the path in rake routes info. 
    end
end