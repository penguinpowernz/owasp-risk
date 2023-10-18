class CreateVulnerabilities < ActiveRecord::Migration[7.1]
  def change
    create_table :vulnerabilities do |t|
      t.string :name
      t.text :desc
      t.text :links
      t.integer :project_id

      t.timestamps
    end
  end
end
