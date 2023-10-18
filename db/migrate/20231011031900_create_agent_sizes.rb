class CreateAgentSizes < ActiveRecord::Migration[7.1]
  def change
    create_table :agent_sizes do |t|
      t.string :name
      t.integer :score

      t.timestamps
    end
  end
end
