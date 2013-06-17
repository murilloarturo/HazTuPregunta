class CreateAcomments < ActiveRecord::Migration
  def change
    create_table :acomments do |t|
      t.integer :answer_id
      t.integer :user_id
      t.integer :question_id
      t.text :text

      t.timestamps
    end
  end
end
