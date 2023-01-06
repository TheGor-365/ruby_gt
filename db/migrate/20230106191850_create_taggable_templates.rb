class CreateTaggableTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :taggable_templates do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
