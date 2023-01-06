class CreateTaggableExamples < ActiveRecord::Migration[7.0]
  def change
    create_table :taggable_examples do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :example, null: false, foreign_key: true

      t.timestamps
    end
  end
end
