class Sublink < ActiveRecord::Base
  self.primary_key = :id
  belongs_to :tab
  belongs_to :page

  def no_urls?
		self.external_url.blank? && self.url.blank?
  end
end
