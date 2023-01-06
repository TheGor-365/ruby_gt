class CommandCode < ApplicationRecord
  belongs_to :command, counter_cache: true
  belongs_to :lang

  has_rich_text :description
end
