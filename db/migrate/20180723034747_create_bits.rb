class CreateBits < ActiveRecord::Migration[5.1]
  def change
    create_table :bits do |t|
      t.string :name
      t.integer :times_used, default: 1

      t.timestamps
    end
  end
end
