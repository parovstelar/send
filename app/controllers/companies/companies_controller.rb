class Companies::CompaniesController < ApplicationController
before_action :is_matching_login_company, only: [:edit, :update]
before_action :authenticate_company!, except: [:top]

  def show
    @company = Company.find(params[:id])
    @questions = Question.where(company_id: @company.id).where.not(answer_content: nil)
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = current_company
    if @company.update(company_params)
      flash[:notice] = "保存が成功しました。"
      redirect_to companies_company_path(@company)
    else
      render :edit
    end
  end

private

  def company_params
    params.require(:company).permit(:head, :name, :link, :address, :content, :schedule, :wage, :vacation, :employment, :welfare)
  end

  def is_matching_login_company
    company_id = params[:id].to_i
    unless company_id == current_company.id
      redirect_to companies_company_path(current_company)
    end
  end

end
