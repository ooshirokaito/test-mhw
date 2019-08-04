class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :item
      t.integer :choice_id
      t.integer :user_id

      t.timestamps
    end
  end
end
