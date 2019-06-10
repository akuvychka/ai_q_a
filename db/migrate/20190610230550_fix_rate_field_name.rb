class FixRateFieldName < ActiveRecord::Migration[5.2]
  def change
    remove_reference :rates, :comments, foreign_key: true
    add_reference :rates, :comment, foreign_key: true
  end
end
