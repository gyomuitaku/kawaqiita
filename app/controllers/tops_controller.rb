class TopsController < ApplicationController

  def home

  end

  def top
    @xlsx = Roo::OpenOffice.new('./word/toeic2000.ods')
    @xlsx.default_sheet = @xlsx.sheets[0]
    @lines = Fileloader.get_lines
  end

  def quiz
    if params[:select_num] == nil
      gon.questions = Quiz.generate(2, 2001)
    else
      num = params[:select_num].to_i
      gon.questions = Quiz.generate(num, num+99)
    end
  end

  def select
  end

end
