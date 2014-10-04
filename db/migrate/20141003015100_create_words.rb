class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :root
      t.string :text
      t.string :pos, default: "noun"
      t.timestamps
    end

    add_index :words, [:text], unique: true
    add_index :words, [:root], unique: false
  end
end
