class CreateSnippetCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :snippet_codes do |t|
      t.text :code
      t.string :path
      t.string :overview
      t.text :description
      t.references :lang, null: false, foreign_key: true

      t.timestamps
    end
  end
end
