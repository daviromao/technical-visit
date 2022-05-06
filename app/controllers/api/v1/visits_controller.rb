class Api::V1::VisitsController < ApplicationController
  before_action :authorize_request
  before_action :find_visit, except: %i[ create index]

  def index
    render json: Visit.all, status: :ok
  end

  def show
    render @visit, status: :ok
  end

  def create
    @visit = Visit.new(visit_params)
    if @visit.save
      render json: @visit, status: :created
    else
      render json: { errors: @visit.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @visit.update(visit_params)
      render json: @visit, status: :ok
    else
      render json: { errors: @visit.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @visit.destroy
    render json: @visit, status: :ok
  end

  private
    def find_answer
      @visit = Visit.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'Visit not found' }, status: :not_found
    end

    def visit_params
      params.require(:visit).permit(:visit_date, :status, :user_id, :check_in, :check_out)
    end
end
