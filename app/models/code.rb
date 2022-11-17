class Code < ApplicationRecord
  belongs_to :snippet
  belongs_to :guide
end
