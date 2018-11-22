class Blog < ApplicationRecord
	enum status: { draft: 0, published: 1 }
	extend FriendlyId
	friendly_id :title, use: :slugged

	validates_presence_of :title, :body

	# 'belongs_to' behavior has changed in rails >= 5.x.
	# Essentually it is now expected that the belongs_to record exists
	# before assigning it to the other side of association.
	# You need to pass 'required :false' while declaring 'belongs_to'
	# in Blog model
	belongs_to :topic, required: false

	def self.special_blogs
		all
	end

	def self.featured_blogs
		limit(2)
	end
end
