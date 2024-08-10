class CitiesController < ApplicationController
  def search
    @states = State.all
  end

  def index
    state = State.find_by(name: params[:state])
    @cities = state ? state.cities.where("name LIKE ?", "%#{params[:name]}%") : []
  end
end
