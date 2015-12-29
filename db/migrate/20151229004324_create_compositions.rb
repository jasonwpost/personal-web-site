class CreateCompositions < ActiveRecord::Migration
  def change
    create_table :compositions do |t|
      t.text :title
      t.text :forces
      t.integer :year
      t.text :programme_note
      t.text :streaming
      t.string :image
      t.timestamps null: false
    end
  end
end
