class TopsController < ApplicationController
  def top
    file = open("./word/word_test.txt")
    @lines = file.read().split("\n")
    require 'roo'
    @xlsx = Roo::OpenOffice.new('./word/toeic2000.ods')
    @xlsx.default_sheet = @xlsx.sheets[0]
  end
end
