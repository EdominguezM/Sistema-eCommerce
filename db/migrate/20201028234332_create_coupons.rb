class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.float "amount", default: 0.0
      t.integer "limit", defaut: 0
      t.date "expiration"
      t.string "code"
      t.boolean "percentage", default: false
      t.integer "used", default: 0, null: false

      t.timestamps
    end
  end
end
