class Result < ApplicationRecord
    belongs_to :user
    
    def self.save_results(quizResults)
        i = 0
        while (quizResults[i.to_s]) do
            result = Result.new(word:quizResults[i.to_s][:en_word],meaning:quizResults[i.to_s][:answer],is_correct:quizResults[i.to_s][:status] ,user_id:quizResults[i.to_s][:user_id])
            result.save
            i += 1
        end
    end
end
