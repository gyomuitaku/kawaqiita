class ResultsController < ApplicationController
  def create
    Result.save_results(params[:quizResults])
    render json: "ok!"
  end
  def create_type
    if params[:results].present?
      result =Result.new
      result.word =params[:results][1]
      result.meaning  =params[:results][0]
      result.is_correct =true
      result.user_id =current_user
      result.save
    end
    if params[:miss].present?
      result =Result.new
      result.word =params[:miss][1]
      result.meaning =params[:miss][0]
      result.is_correct =false
      result.user_id =current_user
      result.save
    end
  end
end
