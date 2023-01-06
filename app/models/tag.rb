class Tag < ApplicationRecord
  has_many :taggables, dependent: :destroy
  has_many :snippets, through: :taggables

  has_many :taggable_guides, dependent: :destroy
  has_many :guides, through: :taggable_guides

  has_many :taggable_commands, dependent: :destroy
  has_many :commands, through: :taggable_commands

  has_many :taggable_tutorials, dependent: :destroy
  has_many :tutorials, through: :taggable_tutorials

  has_many :taggable_examples, dependent: :destroy
  has_many :examples, through: :taggable_examples

  has_many :taggable_templates, dependent: :destroy
  has_many :templates, through: :taggable_templates
end
