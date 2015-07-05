class CreatePrayers < ActiveRecord::Migration
  def change
    create_table :prayers do |t|
      t.references :person, index: true, foreign_key: true
      t.references :prayer_request, index: true, foreign_key: true
      t.text :comment

      t.timestamps null: false
    end
  end
end
