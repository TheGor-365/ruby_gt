class AddPathToGuides < ActiveRecord::Migration[7.0]
  def change
    add_column :guides, :path, :string
  end
end
