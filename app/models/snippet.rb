class Snippet < ApplicationRecord
  has_many :taggables, dependent: :destroy
  has_many :tags, through: :taggables
  belongs_to :language

  has_rich_text :description

  has_many :steps, as: :stepable, dependent: :destroy

  after_create :create_step

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(', ')
  end

  private

  def create_step
    self.steps.create(number: 1)
  end
end
