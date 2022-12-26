class Guide < ActiveRecord::Migration[7.0]
  def change
    create_table :guides do |t|
      t.string :title
      t.string :overview
      t.text :body

      t.timestamps
    end
  end
end
