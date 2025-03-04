class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @offerings = @user.offerings
  end
end
