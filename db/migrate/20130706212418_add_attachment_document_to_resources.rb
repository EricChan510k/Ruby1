class AddAttachmentDocumentToResources < ActiveRecord::Migration
  def self.up
    change_table :resources do |t|
      t.attachment :document
    end
  end

  def self.down
    drop_attached_file :resources, :document
  end
end
