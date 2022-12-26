class GuideCode < ApplicationRecord
  belongs_to :guide, inverse_of: :guide_codes, optional: true
  belongs_to :lang
  validates_presence_of :guide

  has_many :steps, as: :stepable, dependent: :destroy

  has_rich_text :description

  after_create :create_step

  private

  def create_step
    step = 1
    self.steps.create(number: (step += 1))
  end
end
