class Users::AnswersController < ApplicationController
before_action :authenticate_user!, except: [:top]

  def show
    @question = Question.find(params[:id])
  end

end
