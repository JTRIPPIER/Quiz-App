require 'test_helper'

class QuizTest < ActionDispatch::IntegrationTest

  test 'users can see a list of quizes' do
    get '/quizzes'

    assert_select 'h3', 'Ruby basics'
    assert_select 'h3', 'Git basics'

  end
end
