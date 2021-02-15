require 'open-uri'

class FlatsController < ApplicationController
  before_action :get_flats

  def index
    session[:message] = "hey there"
  end

  def show
    id = params['id'].to_i
    @flat = @flats.find { |flat| flat['id'] == id }
  end

  private

  def get_flats
    url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
    @flats = JSON.parse(open(url).read)
  end
end
