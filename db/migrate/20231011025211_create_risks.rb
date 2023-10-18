class CreateRisks < ActiveRecord::Migration[7.1]
  def change
    create_table :risks do |t|
      t.integer :vulnerability_id
      t.decimal :severity, precision: 2

      # threat agent factors
      t.integer :threat_agent_id
      t.integer :agent_motive_id
      t.integer :agent_opportunity_id

      # business impacts
      t.integer :bi_findam_id
      t.integer :bi_repdam_id
      t.integer :bi_ncomp_id
      t.integer :bi_pv_id

      # technical impacts
      t.integer :ti_loc_id
      t.integer :ti_loi_id
      t.integer :ti_loav_id
      t.integer :ti_loac_id

      # vulnerability factors
      t.integer :vf_eod_id
      t.integer :vf_eo_e_id
      t.integer :vf_awareness_id
      t.integer :vf_ids_id

      t.timestamps
    end
  end
end
