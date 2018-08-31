class Room < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :user
  
  def complete_name
    "#{title}, #{location}"
  end

  def self.search(query)
    if query.present?
      where(['location LIKE :query OR
              title LIKE :query OR
              description LIKE :query', query: "%#{query}%"])
    else
      all
    end
  end
  
end

