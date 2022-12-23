class Language < ApplicationRecord
  has_many :snippets, dependent: :destroy

  has_many :guides, dependent: :destroy

  # has_many :guide_codes, through: :guides, inverse_of: :guide
end
