class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  def show
    user = User.find_by!(id: params[:id])
    render json: user, include: :items
  end

  def index_items
    user_items = User.find_by!(id: params[:id]).items
    render json: user_items, status: :ok
  end

  def create_user_items
    user_create = User.find_by!(id: params[:user_id]).items.create!(item_params)
    render json: user_create, status: :created
  end

  def show_item
    item = User.find_by!(id: params[:user_id]).items.find_by!(id: params[:item_id])
    render json: item, status: :ok
  end

  private

  def item_params
    params.permit(:name, :description, :price)
  end

  def render_not_found invalid
    render json: { errors: 'Not Found' }, status: :not_found
  end
end
