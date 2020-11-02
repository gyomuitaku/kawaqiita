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
    @lines = Fileloader.get_lines(0)

    word_set = []
    for i in 2..@lines.last_row-1 do
      if i % 2 == 0
        word_set.push([@lines.row(i)[1], @lines.row(i)[2], @lines.row(i+1)[1], @lines.row(i+1)[2]])
      end
    end
    word_set_shuffle = word_set.shuffle
    # gon.word_set = word_set_shuffle[Range.new(0, 249)]

    @word_sets = word_set_shuffle[Range.new(0, 249)]
    # @without_page = WordSet.all
    # binding.pry
    # trans_num = params[:trans_num]
    # binding.pry
    # if trans_num == nil
    #   @trans_num = 0
    # else
    #   @trans_num = params[:trans_num]
    # end
  end

  def type
    select_file = params[:select_file].to_i
    select_num = params[:select_num].to_i
    quiz_type = params[:quiz_type].to_i
    if select_num != 0
      if quiz_type == 0
        gon.questions = Quiz.type(select_num, select_num+99, select_file)
      elsif quiz_type == 1
        gon.questions = Quiz.type(select_num, select_num+499, select_file)
      else
        gon.questions = Quiz.type(2, 2001, select_file)
      end
    else
      gon.questions = Quiz.type(2, 2001, select_file)
    end
  end
end
