class Companies::QuestionsController < ApplicationController
before_action :is_matching_login_company, only: [:show, :update]
before_action :authenticate_company!, except: [:top]

  def index
    @questions = Question.where(company_id: current_company.id).where(answer_content: nil)
  end

  def show
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(answer_params)
      flash[:notice] = "保存が成功しました。"
      redirect_to companies_questions_path(@question.id)
    else
      render :edit
    end
  end

private

  def answer_params
    params.require(:question).permit(:answer_content)
  end

  def is_matching_login_company
    question = Question.find(params[:id].to_i)
    company = Company.find(question.company_id)
    unless company.id == current_company.id
      redirect_to companies_company_path(current_company)
    end
  end

end
