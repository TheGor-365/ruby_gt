class Command < ApplicationRecord
  has_many :taggable_commands, dependent: :destroy
  has_many :tags, through: :taggable_commands

  belongs_to :language

  has_many :command_codes, inverse_of: :command, dependent: :destroy
  accepts_nested_attributes_for :command_codes,
  reject_if: :all_blank,
  allow_destroy: true

  has_rich_text :description

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(', ')
  end
end
