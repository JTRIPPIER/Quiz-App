require 'test_helper'

class QuizTest < ActiveSupport::TestCase

  test 'Quiz has a title' do
    quiz = quizzes(:ruby_quiz)
    assert_equal 'Ruby basics', quiz.title
  end
end
