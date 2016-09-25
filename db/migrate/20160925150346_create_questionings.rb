class CreateQuestionings < ActiveRecord::Migration[5.0]
  def change
    create_table :questionings do |t|
      t.integer :question_id
      t.string :questionable_type
      t.integer :questionable_id

      t.timestamps
    end
  end
end
