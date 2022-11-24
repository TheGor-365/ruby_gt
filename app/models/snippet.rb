class Snippet < ApplicationRecord
  has_many :taggables, dependent: :destroy
  has_many :tags, through: :taggables
  belongs_to :language

  has_rich_text :description

  has_many :snippet_codes, class_name: 'SnippetCode', dependent: :destroy
  accepts_nested_attributes_for :snippet_codes

  has_many :snippet_descriptions, class_name: 'SnippetDescription', dependent: :destroy
  accepts_nested_attributes_for :snippet_descriptions

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(', ')
  end
end
