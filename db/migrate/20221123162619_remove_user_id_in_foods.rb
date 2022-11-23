class RemoveUserIdInFoods < ActiveRecord::Migration[6.1]
  def change
    remove_column :foods , :user_id , :string
    add_column :foods , :users_id , :string
  end
end
