class Tag < ApplicationRecord
  has_many :taggables, dependent: :destroy
  has_many :taggable_guides, dependent: :destroy
  has_many :taggable_commands, dependent: :destroy
  has_many :snippets, through: :taggables
  has_many :guides, through: :taggable_guides
  has_many :commands, through: :taggable_commands
end
