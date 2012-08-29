class Tab < ActiveRecord::Base
  lang_attr :name

  self.primary_key = :id
  has_many :sublinks, :order => :weight
end
