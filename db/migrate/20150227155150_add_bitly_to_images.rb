class AddBitlyToImages < ActiveRecord::Migration
  def change
    add_column :images, :short_url, :string
  end
end
