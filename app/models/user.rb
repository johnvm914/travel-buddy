class User < ApplicationRecord
  acts_as_messageable
  has_secure_password
  has_many :favorites
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :trips
  has_one :profile
  validates :first_name, :last_name, :email, :user_name, presence: true
  validates :email, :user_name, uniqueness: { case_sensitive: false }

  def name
    user_name
  end

  def mailboxer_email(object)
    email
  end

  def unread_mail
    conversations = mailbox.conversations
    conversations.each do |conversation|
      if conversation.is_unread?(self)
        return true
      end
    end
    return false
  end

  def unread_mail_count
    count = 0
    conversations = mailbox.conversations
    conversations.each do |conversation|
      if conversation.is_unread?(self)
        count += 1
      end
    end
    return count
  end

  def not_friends(id)
    friends.each do |friend|
      if friend.id == id
        return false
      end
    end
    return true
  end
  
end
