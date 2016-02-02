# Not auto loaded because we don't have a Gemfile for this dummy app
require "country_select"

class AddressesDemoController < ApplicationController
  def index
    @addresses = Address.all
  end

  def tags
    @addresses = Address.all
  end

  def update
    @address = Address.find(params[:id])

    if @address.update_attributes(address_params)
      redirect_to root_path, notice: "Updated address!"
    end
  end

  private

  def address_params
    params.require(:address).permit(:title, :subdivision, :country)
  end
end
