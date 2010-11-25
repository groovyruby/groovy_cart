class AddAttachmentToProperties < ActiveRecord::Migration
  def self.up
    add_column :properties, :attachment_file_name, :string
    add_column :properties, :attachment_file_size, :integer
    add_column :properties, :attachment_content_type, :string
  end

  def self.down
    remove_column :properties, :attachment_content_type
    remove_column :properties, :attachment_file_size
    remove_column :properties, :attachment_file_name
  end
end
