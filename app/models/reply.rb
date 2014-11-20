class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates_presence_of :content

  def owner?(user)
  	user == self.user
  end

  

end
