class AddEmailsToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :emails, :text
  end
end
