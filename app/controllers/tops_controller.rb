class TopsController < ApplicationController
  def home
  end
  def top
    file = open("./word/word_test.txt")
    @lines = file.read().split("\n")
    @lines = Fileloader.get_lines
  end

  def quiz
    gon.questions = Quiz.generate
  end

end
