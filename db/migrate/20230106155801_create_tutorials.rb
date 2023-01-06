class CreateTutorials < ActiveRecord::Migration[7.0]
  def change
    create_table :tutorials do |t|
      t.string :title
      t.string :overview
      t.text :body
      t.text :description
      t.string :path
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
