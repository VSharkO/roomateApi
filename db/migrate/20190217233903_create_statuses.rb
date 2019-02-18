class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.string :isActive
      t.string :boolean

      t.timestamps
    end
  end
end
