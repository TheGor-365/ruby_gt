class SnippetCode < ApplicationRecord
  belongs_to :snippet, counter_cache: true
  belongs_to :lang

  has_rich_text :description
end
