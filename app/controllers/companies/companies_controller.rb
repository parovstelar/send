class Companies::CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    @company = current_company
    @company.update(company_params)
    redirect_to company_path(@company.id)
  end

  def show_q
    @question = Question.find(params[:id])
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    redirect_to edit_company_path(@company.id)
  end

private

  def company_params
    params.require(:company).permit(:head, :name, :link, :address, :content, :schedule, :wage, :vacation, :employment, :welfare)
  end

end
