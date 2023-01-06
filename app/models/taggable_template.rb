class TaggableTemplate < ApplicationRecord
  belongs_to :template
  belongs_to :tag
end
