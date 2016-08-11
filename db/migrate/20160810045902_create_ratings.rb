class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :destination
      t.string :country
      t.string :rating

      t.timestamps
    end
  end
end
