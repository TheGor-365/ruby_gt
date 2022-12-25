class Step < ApplicationRecord
  belongs_to :stepable, polymorphic: true
end
