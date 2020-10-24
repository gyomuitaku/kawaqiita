class TopsController < ApplicationController
  def top
    file = open("./word/word_test.txt")
    @lines = file.read().split("\n")
  end
end
