class Users::CompaniesController < ApplicationController
before_action :authenticate_user!, except: [:top]

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @questions = Question.where(company_id: @company.id).where.not(answer_content: nil)
  end

end
