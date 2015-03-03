class AddFirstFrameUrlToImage < ActiveRecord::Migration
  def change
    add_column :images, :first_frame_url, :string
  end
end
