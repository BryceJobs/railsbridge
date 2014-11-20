class Post < ActiveRecord::Base
  belongs_to :user
  has_many :replies
  has_many :votes
  validates_presence_of :title, :content
  default_scope order('created_at desc')
  def replies_count
  	self.replies.count
  end
  
  def owner?(user)
  	user == self.user
  end
  
  def has_voted? ( user)
    shared = self.votes & user.votes
    shared.blank?
  end

  def positive_vote_count
    self.votes.where(vote: 1).count
  end

  def negative_vote_count
      self.votes.where(vote: -1).count
  end

  def votes_summary
    positive_vote_count.to_i - negative_vote_count.to_i
  end

end
