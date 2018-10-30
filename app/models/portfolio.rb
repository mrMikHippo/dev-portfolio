class Portfolio < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

	# Create a custom scopes
	
	def self.math_integrals
		where(subtitle: "Math Integrals")
	end

	scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails") } 
end
