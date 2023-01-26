class Companies::AnswersController < ApplicationController
before_action :authenticate_company!, except: [:top]

  def show
    @question = Question.find(params[:id])
  end

end
