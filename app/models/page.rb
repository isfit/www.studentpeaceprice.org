class Page < ActiveRecord::Base
  lang_attr :title, :ingress, :body

  self.primary_key = :id
  belongs_to :sublink
end
