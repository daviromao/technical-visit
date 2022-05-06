class Api::V1::AnswersController < ApplicationController
  before_action :authorize_request
  before_action :find_answer, except: %i[ create index my_visits]

  def index
    render json: Answers.all, status: :ok
  end

  def my_visits
    @visits = Visit.find_by(user_id: @current_user.id)
    render json: @visits, status: :ok
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      render json: @answer, status: :created
    else
      render json: { errors: @answer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @answer, status: :ok
  end

  def update
    if @answer.update(answers_params)
      render json: @answer, status: :ok
    else
      render json: { errors: @answer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @answer.destroy
    render json: @answer, status: :ok
  end

  private
    def find_answer
      @answer = Answer.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'Answer not found' }, status: :not_found
    end

    def answers_params
      params.require(:answer).permit(:content, :formulary_id, :question_id, :visit_id)
    end

end
