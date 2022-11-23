class RemoveUsersIdInFoods < ActiveRecord::Migration[6.1]
  def change
    remove_column :foods , :users_id , :string
    add_belongs_to :foods, :user
  end
end
