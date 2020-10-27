class ResultsController < ApplicationController
  def create
    Result.save_results(params[:quizResults])
  end
end
