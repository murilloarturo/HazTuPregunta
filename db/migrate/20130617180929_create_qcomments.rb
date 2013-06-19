class CreateQcomments < ActiveRecord::Migration
  def change
    create_table :qcomments do |t|
      t.integer 	:question_id
      t.integer 	:user_id
      t.text 		:text

      t.timestamps
    end
  end
end
