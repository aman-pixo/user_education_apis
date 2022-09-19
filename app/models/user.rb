class User < ApplicationRecord
  has_many :educations, dependent: :destroy
end
