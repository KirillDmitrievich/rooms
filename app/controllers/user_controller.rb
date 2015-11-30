class UserController < ApplicationController
  def index
    @apartments = current_user.apartments
  end
end
