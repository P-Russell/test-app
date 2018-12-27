class HomeController < ApplicationController
  require 'fake_user_data_helper'
  def index
    if User.first.nil?
      users = FakeUserDataHelper.get_data
      users.each do |user|
        userModel = User.new(user)
        userModel.save
      end
    end
    @users = User.all
  end

  def search
    if params[:home]
      if params[:home]['match'] == 'first_name'
        @users = User.where(first_name: params[:home]['with'])
      else
        @users = User.where(last_name: params[:home]['with'])
      end
    else
      redirect_to home_index_path
    end
  end

  private
  def user_name
      params.require(:home).permit(:with)
  end


end
