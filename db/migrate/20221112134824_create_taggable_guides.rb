class CreateTaggableGuides < ActiveRecord::Migration[7.0]
  def change
    create_table :taggable_guides do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :guide, null: false, foreign_key: true

      t.timestamps
    end
  end
end
