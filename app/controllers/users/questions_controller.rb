class Users::QuestionsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @question = Question.new
  end

  def create
    @company = Company.find(params[:company_id])
    question = Question.new(question_params)
    question.save
    redirect_to question_path(@company)
  end

  def index
    @company = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

private

  def question_params
    params.require(:question).permit(:question_content, :title)
  end

end
