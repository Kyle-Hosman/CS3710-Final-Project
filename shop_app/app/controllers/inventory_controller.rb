class InventoryController < ApplicationController
  def show
    @user = User.find_by(id: params[:user_id])
    if @user
      @items = @user.items
    else
      redirect_to root_path, alert: "User not found"
    end
  end
end
