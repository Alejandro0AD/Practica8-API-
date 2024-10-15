class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.integer :number
      t.string :name
      t.decimal :discount
      t.date :validity

      t.timestamps
    end
  end
end
