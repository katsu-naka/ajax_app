class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :content #メモカラムを追加,t.に続くのがカラム型→カラム名
      t.boolean :checked #boolean型というカラム名で既読、未読のチェックを行う。
      t.timestamps
    end
  end
end
