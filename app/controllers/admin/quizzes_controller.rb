class Admin::QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    quiz = Quiz.find(params[:id])

    if quiz.update!(quiz_params)
      flash[:notice] = "You have successfully updated the quiz"
      redirect_to admin_quizzes_path
    else
      flash[:alert] = "Failed to update the quiz"
      render edit_admin_quiz_path(quiz)
    end
  end

  def quiz_params
    params.require(:quiz).permit(:title)
  end

end
