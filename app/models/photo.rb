class Photo < ActiveRecord::Base
  validates :filename, :presence => true
  has_many :reviews
  def image_file=(input_data)
    self.filename = input_data.original_filename
    self.content_type = input_data.content_type.chomp
    self.binary_data = input_data.read
  end
end
