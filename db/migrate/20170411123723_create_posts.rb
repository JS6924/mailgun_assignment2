class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
  #t.저장할 내용의 형태"저장할 내용의 변수 이름"
    t.string"title"
    t.string"content"
    t.string"email"
    
      t.timestamps null: false
    end
  end
end
