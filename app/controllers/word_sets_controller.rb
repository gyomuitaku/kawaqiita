class WordSetsController < ApplicationController
	def create
		WordSet.destroy_all
        for i in 0..498 do
	        if i % 2 == 0
	        	WordSet.create!(
	        	word_first: params[:_json][i][0],
	        	word_second: params[:_json][i][1],
	        	word_third: params[:_json][i+1][0],
	        	word_forth: params[:_json][i+1][1]
	        	)
	        end
	    end
	end
end
