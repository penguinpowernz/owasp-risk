class CreatePrivacyViolationImpacts < ActiveRecord::Migration[7.1]
  def change
    create_table :privacy_violation_impacts do |t|
      t.string :name
      t.integer :score

      t.timestamps
    end
  end
end
