class CompositionsController < ApplicationController
	
	def index
		@compositions = Composition.all.order("compositions.year DESC, compositions.title")
	end

	def show
		@composition = Composition.find(params[:id])
	end

end
