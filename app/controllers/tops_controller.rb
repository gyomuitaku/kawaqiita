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
    # gon.words = Word.generate
    @results = Result.all.shuffle
    @lines = Fileloader.get_lines(0)
    # @kakutanpdf = KakutanPdf.new(@result)
    # @word_set = @kakutanpdf.contents(@result)
    # binding.pry
    word_set = []
    for i in 2..@lines.last_row do
      word_set.push([@lines.row(i)[1], @lines.row(i)[2]])
    end
    gon.word_set = word_set.shuffle
    @word_sets = WordSet.limit(250).page(params[:page])
    @without_page = WordSet.limit(250)
    # binding.pry

    # @word_set_shuffle = Kaminari.paginate_array(word_set.shuffle).page(params[:page]).per(25)

    @num_min_table = 0
    @num_max_table = 24
    @num_min_pdf = 0
    @num_max_pdf = 24
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
