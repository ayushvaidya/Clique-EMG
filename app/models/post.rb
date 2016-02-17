class Post < ActiveRecord::Base
  # Sorting
  default_scope { order :created_at => :desc }
  # Relationships
  has_and_belongs_to_many :reposters, :class_name => 'User'
  belongs_to :poster, :class_name => 'User'
  # validation
  validates :poster, :presence => true
  validates :content, :presence => true
end
