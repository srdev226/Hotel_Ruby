class Payment < ActiveRecord::Base
  has_one :user
end
