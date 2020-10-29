class ResultsController < ApplicationController
  def create
    Result.save_results(params[:quizResults])
    render json: "ok!"
  end
  def create_type
    if params[:results].present?
      result =Result.new
      result.word =params[:results][:answer]
      result.meaning =params[:results][:text]
      result.is_correct =1
      result.user_id =1
      result.save
    end
    if params[:miss].present?
      result =Result.new
      result.word =params[:miss][:answer]
      result.meaning =params[:miss][:text]
      result.is_correct =0
      result.user_id =1
      result.save
    end
  end
end
