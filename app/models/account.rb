class Account < ApplicationRecord
  belongs_to :area

  validates :area, presence: true
  validates :name, presence:true

  
end
