require 'test_helper'

class QuizIntegrationTest < ActionDispatch::IntegrationTest

  test 'admins can see a list of quizzes' do
    get admin_quizzes_path

    assert_select 'h3', 'Ruby basics'
    assert_select 'h3', 'Git basics'

  end

  test 'admins can see a list of questions for a quiz' do
    get admin_quiz_path(quizzes(:ruby_quiz))

    assert_select 'h2', 'Ruby basics'
    assert_select 'p', 'Which of these are a datatype?'
    assert_select 'p', 'How to declare a variable'
  end

  test 'admins can edit a quiz' do
    quiz = quizzes(:ruby_quiz)

    visit admin_quizzes_path
    click_link quiz.title

    fill_in('Title', :with => 'New Quiz Name')
    click_button 'Save'

    assert has_link?('New Quiz Name')
  end

  test 'admins can create a new quiz' do
    visit admin_quizzes_path
    click_link 'Create a new quiz'

    fill_in('Title', :with => 'A New Quiz')
    click_button 'Save'

    assert has_link?('A New Quiz')
  end
end
