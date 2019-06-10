class CreateUserPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_posts do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.bigint :seen_comment_id

      t.timestamps
    end
  end
end
