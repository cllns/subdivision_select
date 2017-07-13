# Not auto loaded because we don't have a Gemfile for this dummy app
require "country_select"

class AddressesDemoController < ApplicationController
  def index
    @addresses = Address.all
  end

  def tags
    @addresses = Address.all
  end

  def custom_field
    @addresses = Address.all
  end

  def update
    @address = Address.find(params[:id])

    if @address.update_attributes(address_params(params[:is_custom]))
      redirect_to root_path, notice: "Updated address!"
    end
  end

  private

  def address_params(is_custom)
    p = params.require(:address).permit(:title, :subdivision, is_custom ? :custom_field : :country)
    p[:country] = p.delete(:custom_field) if is_custom
    p
  end
end
