class AddLanguagesToGuides < ActiveRecord::Migration[7.0]
  def change
    add_reference :guides, :language, null: false, foreign_key: true
  end
end
