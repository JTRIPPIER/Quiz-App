class Admin::QuestionsController < AdminController
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.new()
    @question.answers.build
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

  def destroy
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.find(params[:id])

    if @question.destroy
      flash[:notice] = 'Successfully removed the question'
      redirect_to admin_quiz_path(@quiz)
    else
      flash[:alert] = 'Failed to remove the question'
      byebug
      redirect_to admin_quiz_path(@quiz)
    end
  end

  def question_params
    params.require(:question).permit(:body, answers_attributes: [:id, :body, :destroy])
  end
end
