class SnippetDescription < ApplicationRecord
  belongs_to :snippet

  has_rich_text :description
end
