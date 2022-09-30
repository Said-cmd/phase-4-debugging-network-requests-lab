class ToysController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entitiy

  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toys.create(toy_params)
    render json: toy, status: :created
  end

  def update
    toy = Toy.find_by(id: params[:id])
    toy.update(toy_params)
    render json: toy, status: :accepted
  end

  def destroy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    head :no_content
  end

  private
  
  def toy_params
    params.permit(:id, :name, :image, :likes)
  end

  def render_unprocessable_entitiy(invalid)
    render json: { error: invalid.record.errors }, status: :unprocessable_entitiy
  end

end
