class Choice < ApplicationRecord
  belongs_to :user
  belongs_to :suggestion
end
