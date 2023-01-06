class AddExampleCodesCountToExamples < ActiveRecord::Migration[7.0]
  def change
    add_column :examples, :example_codes_count, :integer
  end
end
