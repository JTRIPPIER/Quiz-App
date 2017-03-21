class AddQuiz < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.string :title

      t.timestamps
    end
  end
end
