class AddPathToGuideCodes < ActiveRecord::Migration[7.0]
  def change
    add_column :guide_codes, :path, :string
  end
end
