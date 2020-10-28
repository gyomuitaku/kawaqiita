class ResultsController < ApplicationController
  def create
    Result.save_results(params[:quizResults])
    render json: "ok!"
  end
end
