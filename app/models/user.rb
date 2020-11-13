class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :results
  devise :omniauthable
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

 def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first

      # Uncomment the section below if you want users to be created if they don't exist
      unless user
          user = User.create(name: data['name'],
             email: data['email'],
             password: Devise.friendly_token[0,20]
          )
      end
      user
    end

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.user_id = user.id
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0,20]
  #   end
  # end

  # def self.without_sns_data(auth)
  #   user = User.where(email: auth.info.email).first

  #     if user.present?
  #       sns = SnsCredential.create(
  #         uid: auth.uid,
  #         provider: auth.provider,
  #         user_id: user.id
  #       )
  #     else
  #       user = User.new(
  #         name: auth.info.name,
  #         email: auth.info.email,
  #       )
  #       sns = SnsCredential.new(
  #         uid: auth.uid,
  #         provider: auth.provider
  #       )
  #     end
  #     return { user: user ,sns: sns}
  #   end

  #  def self.with_sns_data(auth, snscredential)
  #   user = User.where(id: snscredential.user_id).first
  #   unless user.present?
  #     user = User.new(
  #       name: auth.info.name,
  #       email: auth.info.email,
        
  #     )
  #   end
  #   return {user: user}
  #  end

  #  def self.from_omniauth(auth)
  #   uid = auth.uid
  #   provider = auth.provider
  #   snscredential = SnsCredential.where(uid: uid, provider: provider).first
  #   if snscredential.present?
  #     user = with_sns_data(auth, snscredential)[:user]
  #     sns = snscredential
  #   else
  #     user = without_sns_data(auth)[:user]
  #     sns = without_sns_data(auth)[:sns]
  #   end
  #   return { user: user ,sns: sns}
  # end


end
