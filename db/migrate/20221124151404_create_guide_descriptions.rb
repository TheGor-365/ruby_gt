class CreateGuideDescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :guide_descriptions do |t|
      t.text :description
      t.belongs_to :guide, null: false, foreign_key: true

      t.timestamps
    end
  end
end
