class TopsController < ApplicationController

  def home
  end

  def top
    @xlsx = Roo::OpenOffice.new('./word/toeic2000.ods')
    @xlsx.default_sheet = @xlsx.sheets[0]
    @lines = Fileloader.get_lines
  end

  def quiz
    # if params[:select_num]
    #   gon.questions = Quiz.generate(2, 2001)
    select_file = params[:select_file].to_i
    select_num = params[:select_num].to_i
    quiz_type = params[:quiz_type].to_i
    if select_num != 0
      if quiz_type == 0
        gon.questions = Quiz.generate(select_num, select_num+99, select_file)
      elsif quiz_type == 1
        gon.questions = Quiz.generate(select_num, select_num+499, select_file)
      else
        gon.questions = Quiz.generate(2, 2001, select_file)
      end
    else
      gon.questions = Quiz.generate(2, 2001, select_file)
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
    gon.questions = Quiz.type(2, 2000,0)
  end
end
