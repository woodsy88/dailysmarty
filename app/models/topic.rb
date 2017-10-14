class Topic < ApplicationRecord
	#FRIENDLY ID- slug for url
	extend FriendlyId
  friendly_id :title, use: :slugged
  validates_uniqueness_of :slug

	validates_presence_of :title, :slug
end
