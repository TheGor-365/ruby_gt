class TaggableCommand < ApplicationRecord
  belongs_to :tag
  belongs_to :command
end
