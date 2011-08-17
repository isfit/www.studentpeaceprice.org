class Tab < ActiveRecord::Base
  has_many :sublinks, :order => :weight
end
