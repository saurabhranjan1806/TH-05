class QuestionsController < ApplicationController
	before_action :set_question, only: [:show, :submit]
	
	def show
		redirect_to root_path	if !(user_signed_in? && current_user.at_level == params[:id].to_i)
	end

	def submit
		if params[:answer] == @question.solution
			current_user.at_level=current_user.at_level+1
			current_user.save
			flash[:alert] = "Congratulations, you have reached level #{current_user.at_level}"
			redirect_to "/questions/#{current_user.at_level}"
		else
			flash[:alert] = "Sorry! Try again."
			redirect_to :back
		end
	end

	private

	def set_question
		@question=Question.find(params[:id])
	end
end
