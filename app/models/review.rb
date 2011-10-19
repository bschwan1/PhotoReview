class Review < ActiveRecord::Base
  belongs_to :photo
  validates :reviewer, :presence => true,
                       :length => { :minimum => 3 }
  validates :body, :presence => true
end
