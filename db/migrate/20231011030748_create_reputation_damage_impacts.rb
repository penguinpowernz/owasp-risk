class CreateReputationDamageImpacts < ActiveRecord::Migration[7.1]
  def change
    create_table :reputation_damage_impacts do |t|
      t.string :name
      t.integer :score

      t.timestamps
    end
  end
end
