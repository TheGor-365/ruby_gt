class Guide < ApplicationRecord
  has_many :taggable_guides, dependent: :destroy
  has_many :tags, through: :taggable_guides

  belongs_to :language

  has_many :guide_codes, inverse_of: :guide
  accepts_nested_attributes_for :guide_codes, allow_destroy: true, reject_if: :all_blank
  # , reject_if: proc { |attributes| attributes['language_id'].blank? }

  has_many :guide_descriptions
  accepts_nested_attributes_for :guide_descriptions

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
