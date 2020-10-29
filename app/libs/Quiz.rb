class Quiz
    attr_accessor :text, :choice, :answer
    def initialize(text,choice,answer)
        @text = text
        @choice = choice
        @answer = answer
    end

    def self.generate(s,e,select_file)
        questions, i = [], 0
        xlsx = Fileloader.get_lines(select_file)
        xlsx_choice = (s..e).to_a.sample(100)
        for row in 0..99 do
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
    def self.type(s,e,select_file)
        questions = []
        i =e-s
        xlsx = Fileloader.get_lines(select_file)
        xlsx_choice = (s..e).to_a.sample(i)
        for row in 0..(i-1) do
            item = []
            item.push(xlsx.row(xlsx_choice[row]))

            # shuffleで選択肢をばらばらにする
            questions.push([item[0][1], item[0][2]])
        end
        questions
    end
end
