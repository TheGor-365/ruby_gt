class TutorialCode < ApplicationRecord
  belongs_to :tutorial, counter_cache: true
  belongs_to :lang

  has_rich_text :description
end
