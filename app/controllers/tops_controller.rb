class TopsController < ApplicationController

  def home
  end

  def top
    @xlsx = Roo::OpenOffice.new('./word/toeic2000.ods')
    @xlsx.default_sheet = @xlsx.sheets[0]
    @lines = Fileloader.get_lines
  end

  def quiz
    byebug
    if params[:select_num]
      gon.questions = Quiz.generate(2, 2001)
    else
      num = params[:select_num].to_i
      gon.questions = Quiz.generate(num, num+99)
    end
    gon.user_id = current_user ? current_user.id : nil  
  end

  def select
  end

  def kakutan
    gon.words = Word.generate
    # binding.pry
  end
  def type
    gon.questions = Quiz.generate
  end
end
