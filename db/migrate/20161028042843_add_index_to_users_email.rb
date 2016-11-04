class AddIndexToUsersEmail < ActiveRecord::Migration[5.0]
  ## create a database index for email to make email unique in database, not just validation
  def change
    add_index :users, :email, unique: true
  end
end
