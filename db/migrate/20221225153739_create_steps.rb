class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.integer :number
      t.integer :guide_id
      t.integer :guide_code_id
      t.integer :snippet_id

      t.timestamps
    end
  end
end
