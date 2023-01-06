class AddCommandCodesCountToCommands < ActiveRecord::Migration[7.0]
  def change
    add_column :commands, :command_codes_count, :integer, default: 0, null: false
  end
end
