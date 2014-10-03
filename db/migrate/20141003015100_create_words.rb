class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :root
      t.string :text
      t.boolean :needs_a, default: false
      t.timestamps
    end

    add_index :words, [:text], unique: true
    add_index :words, [:root], unique: false
  end
end
