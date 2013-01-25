class Tab < ActiveRecord::Base
  self.primary_key = :id
  has_many :sublinks, :order => :weight

  def self.with_sublinks
    Tab.includes(:sublinks).where(deleted:0).where(:sublinks => {:count.gt => 0})  end

  def self.home
    Tab.first
  end

end
