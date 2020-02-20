# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :text
#  short_url  :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true, uniqueness: true 

  def self.random_code
    short = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: short)
      short = SecureRandom.urlsafe_base64
    end
    short
  end

  def self.create_entry(user, long_url)
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: self.random_code)
  end

  belongs_to :submit,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  #end of class
end








