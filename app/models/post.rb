class Post < ActiveRecord::Base
	validates_presence_of :fullname,:address,:mob_number,:image
	has_attached_file :image, styles: { medium: "500x300#", small: "50x40#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
   belongs_to :posts
end
