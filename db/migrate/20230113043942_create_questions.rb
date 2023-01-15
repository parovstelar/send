class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :company_id
      t.integer :user_id
      t.string :title
      t.text :question_content
      t.text :answer_content
      t.timestamps
    end
  end
end
