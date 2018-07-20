class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.references :user, foreign_key: true
      t.string :project_title
      t.references :name, foreign_key: true
      t.string :question_one
      t.string :question_two
      t.string :question_three

      t.timestamps
    end
  end
end
