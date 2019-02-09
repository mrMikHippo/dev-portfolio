class Portfolio < ApplicationRecord
	has_many :technologies
	accepts_nested_attributes_for :technologies, 
								  reject_if: lambda { |attrs| attrs['name'].blank? }

	include Placeholder
	validates_presence_of :title, :body, :main_image, :thumb_image

	# Create a custom scopes
	def self.math_integrals
		where(subtitle: "Math Integrals")
	end

	def self.by_position
		order("position ASC")
	end

	scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails") }

	# Set default values (create callback)
	after_initialize :set_defaults

	def set_defaults 
		self.main_image ||= Placeholder.image_generator(height: '650', width: '400')
		self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
	end



end
