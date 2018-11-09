class PortfoliosController < ApplicationController
	def index
		@portfolio_items = Portfolio.all
	end

	def math_integrals
		@math_integrals_portfolio_items = Portfolio.math_integrals
	end

	def new
		@portfolio_item = Portfolio.new
		# FIXME This is so hard!
		3.times { @portfolio_item.technologies.build }
	end

	def create
		@portfolio_item = Portfolio.new(portfolio_params)

		respond_to do |format|
		  if @portfolio_item.save
		    format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
		  else
		    format.html { render :new }
		  end
		end
	end

	def edit
		@portfolio_item = Portfolio.find(params[:id])
	end

	def update
		@portfolio_item = Portfolio.find(params[:id])

	    respond_to do |format|
	      if @portfolio_item.update(portfolio_params)
	        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
	      else
	        format.html { render :edit }
	      end
	    end
  	end

  	def show
		@portfolio_item = Portfolio.find(params[:id])
  		
  	end

  	def destroy
  		# Perform to lookup
  		@portfolio_item = Portfolio.find(params[:id])

  		# DEstroy/delete the record
  		@portfolio_item.destroy

  		# Redirect
	    respond_to do |format|
	      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
	    end
  	end

  	private

  	def portfolio_params
  		params.require(:portfolio).permit(:title,
  										  :subtitle,
  										  :body,
  										  technologies_attributes: [:name]
  										 )
  	end

end
