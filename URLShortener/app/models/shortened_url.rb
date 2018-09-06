class ShortenedUrl < ApplicationRecord
  validates :user_id, :short_url, presence: true, uniqueness: true
  
  
  
  def self.create_short(user_id,long_url)
  
    ShortenedUrl.new(user_id: user_id, long_url:long_url, short_url:ShortenedUrl.random_code)
  end
  
  def self.random_code
    new_url = SecureRandom.urlsafe_base64(16)
    while ShortenedUrl.exists?(short_url: new_url)
        new_url = SecureRandom.urlsafe_base64(16)
    end
      short_url  = new_url
  end
  
  belongs_to :user 
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end