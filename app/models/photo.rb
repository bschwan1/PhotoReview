class Photo < ActiveRecord::Base
  def image_file=(input_data)
    self.filename = input_data.original_filename
    self.content_type = input_data.content_type.chomp
    self.binary_data = input_data.read
  end
  validates :filename, :presence => true
  validates_inclusion_of :content_type, :in => %w( image/jpeg ), :message => "must be a jpeg"
  has_many :reviews, :dependent => :destroy
end
