class Companies::QuestionsController < ApplicationController
before_action :authenticate_company!, except: [:top]

  def index
    @questions = Question.where(answer_content: nil)
  end

  def show
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(answer_params)
      redirect_to companies_questions_path(@question.id)
    else
      render :edit
    end
  end

private

  def answer_params
    params.require(:question).permit(:answer_content)
  end

end
