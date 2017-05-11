class CreatePeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :periods do |t|
      t.references :school_cycle, foreign_key: true
      t.string :nombre_periodo
      t.integer :period_type

      t.timestamps
    end
  end
end
