class TranslationsController < ApplicationController

	def count
		# binding.pry
		@trans_num = params[:trans_num].to_i
	end
end
