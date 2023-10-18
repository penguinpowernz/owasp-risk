class CreateNonComplianceImpacts < ActiveRecord::Migration[7.1]
  def change
    create_table :non_compliance_impacts do |t|
      t.string :name
      t.integer :score

      t.timestamps
    end
  end
end
