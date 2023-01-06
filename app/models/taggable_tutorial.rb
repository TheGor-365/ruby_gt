class TaggableTutorial < ApplicationRecord
  belongs_to :tag
  belongs_to :tutorial
end
