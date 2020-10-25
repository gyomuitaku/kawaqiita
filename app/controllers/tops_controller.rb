class TopsController < ApplicationController
  def home
  end
  def top
    file = open("./word/word_test.txt")
    @lines = file.read().split("\n")
    require 'roo'
    @xlsx = Roo::OpenOffice.new('./word/toeic2000.ods')
    @xlsx.default_sheet = @xlsx.sheets[0]
    @lines = Fileloader.get_lines
  end

  def quiz
    gon.questions = Quiz.generate
  end

end
