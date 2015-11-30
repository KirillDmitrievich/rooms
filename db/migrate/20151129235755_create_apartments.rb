class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :title
      t.text   :description
      t.float  :price
      t.float  :lat
      t.float  :lng
      t.text   :options
      t.string :address
      t.string :picture

      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
