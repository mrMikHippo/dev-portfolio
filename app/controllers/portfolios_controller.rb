class PortfoliosController < ApplicationController
	before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
	layout "portfolio"
	access all: [:show, :index, :math_integrals], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all
	
	def index
		@portfolio_items = Portfolio.by_position
	end

    def sort
        params[:order].each do |key, value|
            Portfolio.find(value[:id]).update(position: value[:position])
        end

        render body: nil
        # render nothing: true # deprecated
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
	end

	def update
	    respond_to do |format|
	      if @portfolio_item.update(portfolio_params)
	        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
	      else
	        format.html { render :edit }
	      end
	    end
  	end

  	def show
  	end

  	def destroy
  		# Destroy/delete the record
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

  	def set_portfolio_item
  		@portfolio_item = Portfolio.find(params[:id])
  	end

end
