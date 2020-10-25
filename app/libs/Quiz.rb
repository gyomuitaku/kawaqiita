class Quiz
    attr_accessor :text, :choice, :answer
    def initialize(text,choice,answer)
        @text = text
        @choice = choice
        @answer = answer
    end

    def self.generate
        questions, i = [], 0,
        xlsx = Fileloader.get_lines

        2.upto(xlsx.last_row){ |row|
            # 98なのは+1したときにindexがオーバーしないようにする
            choice_array = Array.new(3){ rand 98 }
            item = []
            item.push(xlsx.row(row))
            for j in choice_array do
                if j != i
                    item.push(xlsx.row(j))
                else
                    #  同じ選択肢が入らないように
                    item.push(xlsx.row(j+1))
                end
            end
            # shuffleで選択肢をばらばらにする
            questions.push(Quiz.new(item[0][1],[item[0][2], item[1][2], item[2][2], item[3][2]].shuffle,item[0][2]))
            i += 1
        }
        questions
    end
end
