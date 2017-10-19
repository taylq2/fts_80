class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.text :content
      t.string :picture

      t.timestamps
    end
  end
end
