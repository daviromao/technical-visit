class Api::V1::QuestionsController < ApplicationController
  before_action :authorize_request
  before_action :find_user_formulary, only: %i[ update destroy create ]

  def index
    @questions = Question.all
    render json: @questions, status: :ok
  end

  def create
    @question = @user_formulary.questions.build(question_params)

    if @question.save
      render json: @question, status: :created
    else
      render json: { errors: @question.errors.full_messages }, status: :unprocessable_entity
    end

  end

  def show
    @question = Question.find(params[:id])
    render json: @question, status: :ok
  end

  def update
    @question = @user_formulary.questions.find(params[:id])

    if @question.update(question_params)
      render json: @question, status: :ok
    else
      render json: { errors: @question.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user_formulary.questions.find(params[:id]).destroy
  end

  private
    def find_user_formulary
      @user_formulary = @current_user.formularies.find(params[:formulary_id])

      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'Formulary not found' }, status: :not_found
    end

    def question_params
      params.require(:question).permit(:name, :question_type, :formulary_id)
    end
end
