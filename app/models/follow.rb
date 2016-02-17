class Follow < ActiveRecord::Base
  # This is essentially a join table
  # Relationships
  belongs_to :follower, :class_name => 'User', :foreign_key => 'follower_id'
  belongs_to :following, :class_name => 'User', :foreign_key => 'following_id'
  validates :follower, :presence => true
  validates :following, :presence => true
end
