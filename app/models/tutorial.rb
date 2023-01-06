class Tutorial < ApplicationRecord
  has_many :taggable_tutorials, dependent: :destroy
  has_many :tags, through: :taggable_tutorials

  belongs_to :language

  has_many :tutorial_codes, inverse_of: :tutorial, dependent: :destroy
  accepts_nested_attributes_for :tutorial_codes,
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
