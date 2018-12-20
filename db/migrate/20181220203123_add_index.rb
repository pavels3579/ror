class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_index(:tests, :category_id)
    add_index(:questions, :test_id)
    add_index(:answers, :question_id)
  end
end
