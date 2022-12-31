class GuideCode < ApplicationRecord
  belongs_to :guide
  belongs_to :lang

  validates_presence_of :guide
  validates_presence_of :lang

  has_many :steps, as: :stepable, dependent: :destroy

  has_rich_text :description

  after_create :create_step

  private

  def create_step
    step = 1
    self.steps.create(number: (step += 1))
  end
end
