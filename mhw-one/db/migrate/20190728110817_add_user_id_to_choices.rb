class AddUserIdToChoices < ActiveRecord::Migration[5.2]
  def change
    add_column :choices, :user_id, :integer
  end
end
