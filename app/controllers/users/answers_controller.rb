class Users::AnswersController < ApplicationController
before_action :authenticate_user!, except: [:top]

  # def index
  #   @questions = Question.where.not(answer: nil)
  # end

  def show
    @question = Question.find(params[:id])
  end

end
