class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.striong :title
      t.text :content
    end
  end
end
