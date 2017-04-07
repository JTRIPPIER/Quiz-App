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

    fill_in('Title', with: 'New Quiz Name')
    click_button 'Save'

    assert has_link?('New Quiz Name')
  end

  test 'admins can create a new quiz' do
    visit admin_quizzes_path
    click_link 'Create a new quiz'

    fill_in('Title', with: 'A New Quiz')
    click_button 'Save'

    assert has_link?('A New Quiz')
  end

  test 'admins can add a question to a quiz' do
    quiz = quizzes(:ruby_quiz)

    visit admin_quiz_path(quiz)
    click_button 'Add question'

    fill_in('Question', with: 'Is this a new question?')
    click_button 'Save'

    assert has_css?('p', text: 'Is this a new question?')
    page.assert_no_selector('.alert-warning', minimum: 1)
  end

  test 'admins can remove a question form a quiz' do
    quiz = quizzes(:ruby_quiz)

    assert_equal 2, quiz.questions.count

    visit admin_quiz_path(quiz)

    within 'tbody tr:last-child' do
      click_button 'Delete'
    end

    page.assert_no_selector('.alert-warning', minimum: 1)
    page.assert_selector('.alert-info', minimum: 1)
    assert_equal 1, quiz.questions.count

  end

  # Test locking database
  # test 'admins can add a question and answers to a quiz' do
  #   Capybara.current_driver = Capybara.javascript_driver
  #   assert_equal 2, Question.count
  #
  #   quiz = quizzes(:ruby_quiz)
  #
  #   visit admin_quiz_path(quiz)
  #   click_button 'Add question'
  #
  #   fill_in('Question', with: 'Is this a new question?')
  #   fill_in('question_answers_attributes_0_body', with: 'Yes it is')
  #
  #   page.find('.add_fields').click
  #
  #   within '#multiple-answers .form-group:last-child' do
  #     find('input').set 'No it is not'
  #   end
  #
  #   page.find('#submit_button').click
  #   sleep(4)
  #   page.evaluate_script('window.location.reload()')
  #   # switch back to default driver or database is locked
  #   Capybara.use_default_driver
  #   page.assert_no_selector('.alert-warning', minimum: 1)
  #   assert has_css?('p', text: 'Is this a new question?')
  #   assert has_css?('li', text: 'Yes it is')
  #   assert has_css?('li', text: 'No it is not')
  # end

  test 'admins can add an answer for a question' do
    quiz = quizzes(:ruby_quiz)

    visit admin_quiz_path(quiz)

    within('tbody tr:last-child') do
      click_link('Add answers')
    end

    fill_in('Body', with: 'This is the answer')
    click_button 'Save'

    page.assert_no_selector('.alert-warning', minimum: 1)
    assert has_css?('li', text: 'This is the answer')
  end
end
