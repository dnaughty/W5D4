# == Schema Information
#
# Table name: visits
#
#  id         :bigint           not null, primary key
#  url_id     :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Visit < ApplicationRecord

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User 

  belongs_to :s_url,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :ShortenedUrl


  










end
