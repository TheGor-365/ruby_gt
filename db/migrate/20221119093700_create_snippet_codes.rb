class CreateSnippetCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :snippet_codes do |t|
      t.text :code
      t.references :guide, null: false, foreign_key: true


      t.timestamps
    end
  end
end
