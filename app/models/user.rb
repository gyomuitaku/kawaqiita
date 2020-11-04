class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :results

  def self.user_update(data)
    user = User.find(data[:user_id])
    case data[:quiz_file]
    when "0" then
      user.update(toeic_status: data[:level])
    when "1" then
      user.update(novel_status: data[:level])
    when "2" then
      user.update(paper_status: data[:level])
    end
  end
end
