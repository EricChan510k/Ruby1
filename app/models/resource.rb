class Resource < ActiveRecord::Base  
  belongs_to :resourceable, :polymorphic=>true
	attr_accessible :document

  has_attached_file :document, 
  									:url  => "/assets/documents/:basename.:extension",
                    :path => ":rails_root/public/assets/documents/:basename.:extension"

  validates_attachment_presence :document
  validates_attachment_size :document, :less_than => 10.megabytes
  #validates_attachment_content_type :document, :content_type => ['application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']
end