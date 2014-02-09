module ImageHelper

=begin
  version :thumb do
 	  process :resize_to_fill => [75, 75]
  end

  version :tiny do
    process :resize_to_fill => [20, 20]
  end

  version :small do
    process :resize_to_fill => [100, 100]
  end
=end
 

end