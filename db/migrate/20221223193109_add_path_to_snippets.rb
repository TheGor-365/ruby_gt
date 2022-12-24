class AddPathToSnippets < ActiveRecord::Migration[7.0]
  def change
    add_column :snippets, :path, :string
  end
end
