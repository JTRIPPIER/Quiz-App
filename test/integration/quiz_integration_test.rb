require 'test_helper'

class QuizIntegrationTest < ActionDispatch::IntegrationTest

  test 'users can see a list of quizzes' do
    get '/quizzes'

    assert_select 'h3', 'Ruby basics'
    assert_select 'h3', 'Git basics'

  end

    test 'users can see a list of questions for a quiz' do
      get quiz_path(quizzes(:ruby_quiz))

      assert_select 'h2', 'Ruby basics'
      assert_select 'p', 'Which of these are a datatype?'
      assert_select 'p', 'How to declare a variable'

    end

end
