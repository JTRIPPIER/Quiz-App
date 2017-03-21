class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
  end

end
