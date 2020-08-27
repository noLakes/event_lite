class ChangeTimeForEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :date, :string
    remove_column :events, :time, :string
    add_column :events, :time, :datetime
  end
end
