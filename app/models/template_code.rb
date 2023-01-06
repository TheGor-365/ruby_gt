class TemplateCode < ApplicationRecord
  belongs_to :template, counter_cache: true
  belongs_to :lang

  has_rich_text :description
end
