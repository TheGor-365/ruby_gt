class Language < ApplicationRecord
  has_many :snippets, dependent: :destroy
  has_many :guides, dependent: :destroy
  has_many :commands, dependent: :destroy
end
