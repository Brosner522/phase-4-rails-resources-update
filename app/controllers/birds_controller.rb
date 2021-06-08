class BirdsController < ApplicationController

  def incrament_likes
    bird = Bird.find_by(id: params[:id])
    #Use the current number of likes + 1 to determine the next number of likes
    bird.update(likes: bird.likes + 1)
    render json: bird
  end

  def update
    #find the bird we are trying to update
    bird = Bird.find_by(id: params[:id])
    #update the bird, using data from the body
    bird.update(bird_params)
    #send a response with updated bird
    render json: bird
  end

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

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

  def bird_params
    params.permit(:name, :species, :likes)
  end

end
