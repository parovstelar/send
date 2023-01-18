class Users::AnswersController < ApplicationController

  def index_qa
    @question = Question.where.not(answer: nil)
  end

  def show_qa
    @question = Question.find(params[:id])
  end

end
