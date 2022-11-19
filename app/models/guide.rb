class Guide < ApplicationRecord
  has_many :taggable_guides, dependent: :destroy
  has_many :tags, through: :taggable_guides
  belongs_to :language

  # has_many :codes, inverse_of: :guides
  # accepts_nested_attributes_for :codes, reject_if: :all_blank, allow_destroy: true

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(', ')
  end
end
