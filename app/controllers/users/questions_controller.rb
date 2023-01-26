class Users::QuestionsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @question = Question.new
  end

  def create
    @company = Company.find(params[:company_id])
    @question = Question.new(question_params)
    @question.company_id = @company.id
    if @question.save
      redirect_to new_company_question_path(@company)
    else
      render :new
    end
  end

private

  def question_params
    params.require(:question).permit(:question_content, :title)
  end

end
