class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :data
      t.integer :ticket_id
      t.integer :question_id
      t.string :answerable_type
      t.integer :answerable_id

      t.timestamps
    end
  end
end
