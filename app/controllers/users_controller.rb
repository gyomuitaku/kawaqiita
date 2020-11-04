class UsersController < ApplicationController
  def show
  end
  def update
    User.user_update(params[:datas]["0"])
    render json: "ok"
  end
end
