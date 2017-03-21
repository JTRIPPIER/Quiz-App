require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  test 'Question belongs to a quiz' do
    question = questions(:ruby_question_one)
    assert_respond_to question, :quiz
    assert_equal quizzes(:ruby_quiz), question.quiz
  end

end
