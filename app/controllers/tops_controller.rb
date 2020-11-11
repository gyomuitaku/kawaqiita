class TopsController < ApplicationController

  def home
  end

  def about
  end

  def quiz
    quiz_level = params[:level]
    user_id = current_user ? current_user.id : nil
    @test = ["level" => quiz_level,"quiz_file"=> params[:select_file], "user_id"=>user_id] if params[:test]
    gon.test = @test
    # 単語の選択
    gon.questions = Quiz.select_question_type(params[:select_num], params[:quiz_type], params[:select_file])
  end

  def select
    gon.user_level_array = current_user ? {"toeic"=>current_user.toeic_status,"novel"=>current_user.novel_status,"paper"=>current_user.paper_status} : 0
  end


  def toeic
    @list =Fileloader.reader(0)
    @number =0                  
  end
  
  def paper
    @list =Fileloader.reader(1)
    @number =1 
  end

  def novel
    @list =Fileloader.reader(2)
    @number =2 
  end

  def search   
    if params[:search].present?
        @list =Fileloader.reads(params[:search],params[:number],params[:model])
    end  
  end

  def kakutan
    @word_sets = Fileloader.pdf_words(params[:select_num], params[:word_range], params[:select_file])
    @select_num_array = ['', 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    @selected_num = ''
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
      elsif quiz_type == 2
        gon.questions = Quiz.type(select_num, select_num+999, select_file)
      elsif quiz_type == 3
        gon.questions = Quiz.type(2, 2001, select_file)
      else
        gon.questions = Quiz.type(2, 2001, select_file)
      end
    else
      gon.questions = Quiz.type(2, 2001, select_file)
    end
  end
end
