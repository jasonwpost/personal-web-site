class CompositionsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

	def new
		@composition = Composition.new
	end

	def create
		@composition = Composition.new(composition_params)
		if @composition.save
			flash[:success] = "Composition created"
			redirect_to @composition
		else
			render 'new'
		end
	end
	
	def index
		@compositions = Composition.all.order("compositions.year DESC, compositions.title")
	end

	def show
		@composition = Composition.find(params[:id])
	end

	def edit
		@composition = Composition.find(params[:id])
	end

	def update
		@composition = Composition.find(params[:id])
		if @composition.update_attributes(composition_params)
			flash[:success] = "Composition Updated"
			redirect_to compositions_path
		else
			render 'edit'
		end
	end
		

	def destroy
		Composition.find(params[:id]).destroy
		flash[:success] = "Composition deleted"
		redirect_to compositions_path
	end

	private 

	def composition_params
		params.require(:composition).permit(:title, :forces, :year, :programme_note, :streaming, :image)
	end


end
