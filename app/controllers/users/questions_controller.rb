class Users::QuestionsController < ApplicationController

  def new
    @company = Company.find(params[:id])
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to new_question_path(@question.id)
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
