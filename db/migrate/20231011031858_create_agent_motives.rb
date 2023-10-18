class CreateAgentMotives < ActiveRecord::Migration[7.1]
  def change
    create_table :agent_motives do |t|
      t.string :name
      t.integer :score

      t.timestamps
    end
  end
end
