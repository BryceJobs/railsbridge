class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :user, index: true
      t.text :content
      t.references :post, index: true

      t.timestamps
    end
  end
end
