class Quiz
    attr_accessor :text, :choice, :answer
    def initialize(text,choice,answer)
        @text = text
        @choice = choice
        @answer = answer
    end

    def self.generate
        questions, i = [], 0,
        lines = Fileloader.get_lines 

        while i < lines.length do
            # 98なのは+1したときにindexがオーバーしないようにする
            choice_array = Array.new(3){ rand 98 }
            item = []
            item.push(lines[i].chomp.split("/", 2))
            for j in choice_array do
                if j != i
                    item.push(lines[j].chomp.split("/", 2))
                else
                    #  同じ選択肢が入らないように
                    item.push(lines[j+1].chomp.split("/", 2)) 
                end
            end
            # shuffleで選択肢をばらばらにする
            questions.push(Quiz.new(item[0][0],[item[0][1], item[1][1], item[2][1], item[3][1]].shuffle,item[0][1]))
            i += 1
        end
        questions
    end
end