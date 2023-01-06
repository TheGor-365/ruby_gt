class AddTemplateCodesCountToTemplates < ActiveRecord::Migration[7.0]
  def change
    add_column :templates, :template_codes_count, :integer
  end
end
