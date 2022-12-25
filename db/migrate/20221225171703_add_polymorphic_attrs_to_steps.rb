class AddPolymorphicAttrsToSteps < ActiveRecord::Migration[7.0]
  def change
    add_column :steps, :stepable_type, :string
    add_column :steps, :stepable_id, :integer
    
    remove_column :steps, :guide_id, :integer
    remove_column :steps, :guide_code_id, :integer
    remove_column :steps, :snippet_id, :integer
  end
end
