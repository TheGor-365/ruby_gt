class CreateSnippetDescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :snippet_descriptions do |t|
      t.text :description
      t.belongs_to :snippet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
