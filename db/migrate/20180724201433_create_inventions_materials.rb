class CreateInventionsMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :inventions_materials do |t|
      t.references :invention, foreign_key: true
      t.references :material, foreign_key: true

      t.timestamps
    end
  end
end
