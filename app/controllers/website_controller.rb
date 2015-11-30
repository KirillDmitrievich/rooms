class WebsiteController < ApplicationController
  def index
    @apartments = Apartment.all
  end
end
