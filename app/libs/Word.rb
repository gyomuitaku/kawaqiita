class Word
	attr_accessor :english, :japanese
    def initialize(english,japanese)
        @english = english
        @japanese = japanese
    end

    def self.generate
    	words, i = [], 0,
        xlsx = Fileloader.get_lines
        xlsx_choice = (2..2001).to_a.sample(52)

        for row in 1..51 do
            item = []
            item.push(xlsx.row(xlsx_choice[row]))
            words.push(Word.new(item[0][1],item[0][2]))
        end
        words
    end
end