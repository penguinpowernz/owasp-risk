class CreateFinancialDamageImpacts < ActiveRecord::Migration[7.1]
  def change
    create_table :financial_damage_impacts do |t|
      t.string :name
      t.integer :score

      t.timestamps
    end
  end
end
