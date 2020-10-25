class Fileloader
    
    def self.get_lines
        file = open("./word/word_test.txt")
        file.read().split("\n")
    end

end