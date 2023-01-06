class CreateTemplateCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :template_codes do |t|
      t.string :title
      t.string :overview
      t.text :code
      t.text :description
      t.string :path
      t.references :lang, null: false, foreign_key: true
      t.references :template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
