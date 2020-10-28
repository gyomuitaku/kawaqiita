class Quiz
    attr_accessor :text, :choice, :answer
    def initialize(text,choice,answer)
        @text = text
        @choice = choice
        @answer = answer
    end

    def self.generate(s,e)
        questions, i = [], 0,
        xlsx = Fileloader.get_lines
        xlsx_choice = (s..e).to_a.sample(100)
        for row in 1..100 do
            # 98なのは+1したときにindexがオーバーしないようにする
            choice_array = Array.new(3){ rand s..(e-1) }
            item = []
            item.push(xlsx.row(xlsx_choice[row]))
            for j in choice_array do
                if j != xlsx_choice[row]
                    item.push(xlsx.row(j))
                else
                    #  同じ選択肢が入らないように
                    item.push(xlsx.row(j+1))
                end
            end
            # shuffleで選択肢をばらばらにする
            questions.push(Quiz.new(item[0][1],[item[0][2], item[1][2], item[2][2], item[3][2]].shuffle, item[0][2]))
        end
        questions
    end
end
