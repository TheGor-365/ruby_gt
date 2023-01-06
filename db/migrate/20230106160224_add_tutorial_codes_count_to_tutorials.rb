class AddTutorialCodesCountToTutorials < ActiveRecord::Migration[7.0]
  def change
    add_column :tutorials, :tutorial_codes_count, :integer
  end
end
