class CreateInventionsBits < ActiveRecord::Migration[5.1]
  def change
    create_table :inventions_bits do |t|
      t.references :invention, foreign_key: true
      t.references :bit, foreign_key: true

      t.timestamps
    end
  end
end
