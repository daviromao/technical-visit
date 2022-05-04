class Api::V1::FormulariesController < ApplicationController
  before_action :authorize_request
  before_action :find_user_formulary, only: %i[ update destroy ]

  def index
    @formularies = Formulary.all
    render json: @formularies, status: :ok
  end

  def create
    @formulary = @current_user.formularies.build(formulary_params)

    if @formulary.save
      render json: @formulary, status: :created
    else
      render json: { errors: @formulary.errors.full_messages }, status: :unprocessable_entity
    end

  end

  def show
    @formulary = Formulary.find(params[:id])
    render json: @formulary, status: :ok
  end

  def update
    if @formulary.update(user_params)
      render json: @formulary, status: :ok
    else
      render json: { errors: @formulary.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @formulary.destroy
    render json: @formulary, status: :ok
  end

  private
    def find_user_formulary
      @formulary = @current_user.formularies.find(params[:id])

      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'Formulary not found' }, status: :not_found
    end

    def formulary_params
      params.require(:formulary).permit(:name, :user_id)
    end
end
