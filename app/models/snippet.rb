class Snippet < ApplicationRecord
  has_many :taggables, dependent: :destroy
  has_many :tags, through: :taggables

  belongs_to :language

  has_many :snippet_codes, inverse_of: :snippet, dependent: :destroy, counter_cache: :count_of_snippet_codes
  accepts_nested_attributes_for :snippet_codes,
  # reject_if: proc { |attributes| ( attributes['snippet_id'].blank? ) },
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
