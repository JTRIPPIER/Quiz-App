require 'test_helper'

class QuizTest < ActiveSupport::TestCase

  test 'Quiz has a title' do
    quiz = quizzes(:ruby_quiz)
    assert_equal 'Ruby basics', quiz.title
  end

  test 'Quiz has a questions' do
    quiz = quizzes(:ruby_quiz)
    assert_respond_to quiz, :questions
    assert_equal 2, quiz.questions.count
  end

end
