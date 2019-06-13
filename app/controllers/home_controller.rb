# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @search = params[:q]
    @locations = helpers.select_location(@search)
  end
end
