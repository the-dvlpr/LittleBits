class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.integer :times_used, default: 1

      t.timestamps
    end
  end
end
