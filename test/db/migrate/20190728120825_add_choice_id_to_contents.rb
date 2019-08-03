class AddChoiceIdToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :choice_id, :integer
  end
end
