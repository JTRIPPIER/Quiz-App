class Admin::QuestionsController < ApplicationController
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.new
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.new(question_params)

    if @question.save
      flash[:notice] = 'Successfully created a question'
      redirect_to admin_quiz_path(@quiz)
    else
      flash[:alert] = 'Failed to create question'
      redirect_to new_admin_quiz_question_path(@quiz)
    end
  end

  def question_params
    # params.require(:quiz).permit(:title, questions: [:body, :quiz_id] )
    params.require(:question).permit(:body)
  end
end
