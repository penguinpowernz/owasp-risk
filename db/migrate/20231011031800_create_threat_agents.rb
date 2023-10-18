class CreateThreatAgents < ActiveRecord::Migration[7.1]
  def change
    create_table :threat_agents do |t|
      t.string :name
      t.text :desc
      t.integer :skill_id
      t.integer :size_id

      t.timestamps
    end
  end
end
