class Lang < ApplicationRecord
  has_one :guide_code
  has_one :snippet_code
end
