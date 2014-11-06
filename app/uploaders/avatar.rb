class Avatar < CarrierWave::Uploader::Base

	include CarrierWave::MiniMagick

	storage :file
	process :resize_to_fit => [200, 200]

	def store_dir
		'images'
	end

	def extension_white_list
    %w(jpg jpeg gif png)
  end


end