class AddPostcodeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postcode, :integer
  end
end
