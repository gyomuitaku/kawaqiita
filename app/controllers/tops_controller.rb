class TopsController < ApplicationController
  def top
<<<<<<< HEAD
    file = open("./word/word_test.txt")
    @lines = file.read().split("\n")
    file.close()
=======
    @lines = Fileloader.get_lines
>>>>>>> origin/develop
  end

  def quiz
    gon.questions = Quiz.generate
  end

end
