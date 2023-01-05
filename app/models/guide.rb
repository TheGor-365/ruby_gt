class Guide < ApplicationRecord
  has_many :taggable_guides, dependent: :destroy
  has_many :tags, through: :taggable_guides

  belongs_to :language

  has_many :guide_codes, inverse_of: :guide, dependent: :destroy
  accepts_nested_attributes_for :guide_codes,
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
