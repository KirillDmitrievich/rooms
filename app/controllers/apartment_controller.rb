class ApartmentController < ApplicationController
  before_action :authenticate_user!, except: [:list, :show]

  def new
    @apartment = Apartment.new
  end

  def create
    current_user.apartments.create params['apartment'].permit!
    redirect_to controller: 'user', action: 'index'
  end

  def delete
    Apartment.find(params[:id]).delete
    redirect_to controller: 'user', action: 'index'
  end

  def update
    apartment = Apartment.find(params[:id])
    apartment.update params['apartment'].permit!
    redirect_to controller: 'user', action: 'index'
  end

  def list
    sw = params['coords']['sw']
    ne = params['coords']['ne']
    apartments = Apartment.where('lat BETWEEN ? AND ? AND lng BETWEEN ? AND ? ',
                                  sw['lat'], ne['lat'], sw['lng'], ne['lng'])

    render partial: 'partials/apartments', locals: { apartments: apartments }
  end

  def show
    @apartment = Apartment.find(params[:id])
  end

  def edit
    @apartment = Apartment.find(params[:id])
  end
end
