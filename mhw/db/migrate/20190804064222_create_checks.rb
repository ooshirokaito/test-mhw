class CreateChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :checks do |t|
      t.references :user, foreign_key: true
      t.references :content, foreign_key: true

      t.timestamps
      t.index [:user_id, :content_id], unique:true
    end
  end
end
