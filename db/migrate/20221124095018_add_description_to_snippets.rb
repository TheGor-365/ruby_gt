class AddDescriptionToSnippets < ActiveRecord::Migration[7.0]
  def change
    add_column :snippets, :description, :text
  end
end
