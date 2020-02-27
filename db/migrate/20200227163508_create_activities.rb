class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :type
      t.number :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
