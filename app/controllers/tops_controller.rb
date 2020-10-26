class TopsController < ApplicationController

  def home
  
  end

  def top
    @xlsx = Roo::OpenOffice.new('./word/toeic2000.ods')
    @xlsx.default_sheet = @xlsx.sheets[0]
    @lines = Fileloader.get_lines
  end

  def quiz
    gon.questions = Quiz.generate
  end

  def input
    byebug
    quizResults = params[:quizResults]
    i = 0
    while (quizResults[i.to_s] != nil) do
      result = Result.new()
      result.word = quizResults[i.to_s][:en_word]
      result.meaning = quizResults[i.to_s][:answer]
      result.is_correct = quizResults[i.to_s][:status]
      result.user_id = 0
      result.save
      i += 1
    end
  end
end
