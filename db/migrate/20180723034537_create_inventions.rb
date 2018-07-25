class CreateInventions < ActiveRecord::Migration[5.1]
  def change
    create_table :inventions do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :user_name
      t.string :user_email
      t.string :image_url
      t.boolean :display_name, default: true
      t.boolean :display_email, default: true

      t.timestamps
    end
  end
end
