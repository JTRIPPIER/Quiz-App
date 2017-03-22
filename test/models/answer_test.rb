require 'test_helper'

class AnswerTest < ActiveSupport::TestCase

  test 'Answer has a question' do
    answer = answers(:one)
    assert_respond_to answer, :question
    assert_equal questions(:ruby_question_one), answer.question
  end
end
