class Photo < ActiveRecord::Base
  def image_file=(input_data)
    self.filename = input_data.original_filename
    self.content_type = input_data.content_type.chomp
    self.binary_data = input_data.read
  end
  validates :title, :presence => true,
                    :length => { :minimum => 6 }
  validates :filename, :presence => true
  validates_inclusion_of :content_type, :in => %w(image/jpeg image/gif), :message => "must be a jpeg or gif"
  has_many :reviews, :dependent => :destroy
end
