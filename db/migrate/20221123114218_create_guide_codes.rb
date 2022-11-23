class CreateGuideCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :guide_codes do |t|
      t.text :code
      t.belongs_to :guide, null: false, foreign_key: true

      t.timestamps
    end
  end
end
