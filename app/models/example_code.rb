class ExampleCode < ApplicationRecord
  belongs_to :example, counter_cache: true
  belongs_to :lang

  has_rich_text :description
end
