class CreateLangs < ActiveRecord::Migration[7.0]
  def change
    create_table :langs do |t|
      t.string :name

      t.timestamps
    end
    add_index :langs, :name
  end
end
