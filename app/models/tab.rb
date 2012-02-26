class Tab < ActiveRecord::Base
  self.primary_key = :id
  has_many :sublinks, :order => :weight
end
