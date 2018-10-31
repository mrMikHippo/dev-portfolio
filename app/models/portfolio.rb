class Portfolio < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

	# Create a custom scopes
	def self.math_integrals
		where(subtitle: "Math Integrals")
	end

	scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails") }

	# Set default values (create callback)
	after_initialize :set_defaults

	def set_defaults 
		self.main_image ||= "https://via.placeholder.com/600x400"
		self.thumb_image ||= "https://via.placeholder.com/300x200"
	end

end
