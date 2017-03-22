class Admin::AnswersController < ApplicationController
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answers_params)

    if @answer.save
      flash[:notice] = "Successfully added answer"
      redirect_to admin_quiz_path(@quiz)
    else
      flash[:alert] = "Failed to add answer"
      render action: :new
    end
  end

  def answers_params
    params.require(:answer).permit(:body)
  end
end
