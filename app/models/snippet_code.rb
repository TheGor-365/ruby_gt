class SnippetCode < ApplicationRecord
  belongs_to :lang
  belongs_to :snippet

  has_rich_text :description
end
