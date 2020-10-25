class TopsController < ApplicationController
  def top
    @lines = Fileloader.get_lines
  end

  def quiz
    gon.questions = Quiz.generate
  end

end
