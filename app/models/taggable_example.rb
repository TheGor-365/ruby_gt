class TaggableExample < ApplicationRecord
  belongs_to :tag
  belongs_to :example
end
