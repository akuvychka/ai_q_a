class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.references :user, foreign_key: true
      t.references :comments, foreign_key: true
      t.boolean :value

      t.timestamps
    end
  end
end
