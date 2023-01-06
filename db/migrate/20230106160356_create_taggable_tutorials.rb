class CreateTaggableTutorials < ActiveRecord::Migration[7.0]
  def change
    create_table :taggable_tutorials do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :tutorial, null: false, foreign_key: true

      t.timestamps
    end
  end
end
