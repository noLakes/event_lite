class CreateAttendings < ActiveRecord::Migration[5.2]
  def change
    create_table :attendings do |t|
      t.belongs_to :event
      t.belongs_to :user
      t.timestamps
    end
  end
end
