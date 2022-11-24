class GuideDescription < ApplicationRecord
  belongs_to :guide

  has_rich_text :description
end
