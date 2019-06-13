# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @search = params[:q]
    @location = helpers.locate(@search) unless @search.nil?
  end
end
