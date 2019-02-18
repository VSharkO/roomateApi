class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :deviceId
      t.string :integer
      t.string :message
      t.string :string

      t.timestamps
    end
  end
end
