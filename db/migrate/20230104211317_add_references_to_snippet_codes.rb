class AddReferencesToSnippetCodes < ActiveRecord::Migration[7.0]
  def change
    add_reference :snippet_codes, :snippet, null: false, foreign_key: true
  end
end
