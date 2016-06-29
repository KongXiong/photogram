class AddUserIdToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :user, index: true, foreign_key: true
    add_foreign_key :posts, :users
  end
end
