class Quiz
    attr_accessor :text, :choice, :answer
    def initialize(text,choice,answer)
        @text = text
        @choice = choice
        @answer = answer
    end

    def self.generate
        questions = []   
        a =[]
        Fileloader.get_lines.each do |p|  
            b= p.chomp.split("/", 2)
            a.push(b[1])
        end

        Fileloader.get_lines.each do |line|    
            item = line.chomp.split("/", 2) 
            questions.push(Quiz.new(item[0],[item[1], a[rand(100)], a[rand(100)], a[rand(100)]],item[1]))
        end
        questions
    end
end