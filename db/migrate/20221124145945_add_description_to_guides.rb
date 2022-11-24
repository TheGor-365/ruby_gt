class AddDescriptionToGuides < ActiveRecord::Migration[7.0]
  def change
    add_column :guides, :description, :text
  end
end
