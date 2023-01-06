class Example < ApplicationRecord
  has_many :taggable_examples, dependent: :destroy
  has_many :tags, through: :taggable_examples

  belongs_to :language

  has_many :example_codes, inverse_of: :example, dependent: :destroy
  accepts_nested_attributes_for :example_codes,
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
