class Rule < ApplicationRecord
  belongs_to :management, optional: true
  belongs_to :user, optional: true
end
