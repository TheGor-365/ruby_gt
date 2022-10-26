class CreateRailsGuides < ActiveRecord::Migration[7.0]
  def change
    create_table :rails_guides do |t|
      t.string :title
      t.string :author
      t.string :description
      t.string :body

      t.timestamps
    end
  end
end
