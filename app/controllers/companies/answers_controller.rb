class Companies::AnswersController < ApplicationController

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to edit_company_answer_path(@question.id)
  end

  def index_qa
    @question = Question.where.not(answer: nil)
  end

  def show_qa
    @question = Question.find(params[:id])
  end

private

  def question_params
    params.require(:question).permit(:answer_content)
  end

end
