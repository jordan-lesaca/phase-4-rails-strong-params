class BirdsController < ApplicationController

  ActiveSupport.on_load(:action_controller) do
    wrap_parameters format: []
  end 

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  # def create #1=> When we call params.permit(:name, :species)), this will return a new hash with only the name and species keys. 
  #   #1=> Rails will also mark this new hash as permitted, which means we can safely use this new hash for mass assignment. 
  #   bird = Bird.create(params.permit(:name, :species))
  #   render json: bird, status: :created
  # end 

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  private
  # all methods below here are private

  def bird_params
    params.permit(:name, :species)
  end

end