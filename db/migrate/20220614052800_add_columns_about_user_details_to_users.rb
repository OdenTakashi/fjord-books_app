class AddColumnsAboutUserDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postcode, :string
    add_column :users, :address, :string
    add_column :users, :selfintroduce, :text
  end
end
