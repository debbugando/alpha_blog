class AddUserIdToArtigos < ActiveRecord::Migration
  def change
    add_column :artigos, :user_id, :integer 
  end
end
