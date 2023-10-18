class Risk < ApplicationRecord

  belongs_to :vulnerability
  has_one :project, through: :vulnerability

  # threat agents
  belongs_to :threat_agent, optional: true
  belongs_to :agent_motive, optional: true
  belongs_to :agent_opportunity, optional: true

  # vulnerability factors
  belongs_to :vf_eod, optional: true, class_name: "VulnerabilityEod"
  belongs_to :vf_eo_e, optional: true, class_name: "VulnerabilityEoE"
  belongs_to :vf_awareness, optional: true, class_name: "VulnerabilityAwareness"
  belongs_to :vf_ids, optional: true, class_name: "VulnerabilityId"

  # technical impacts
  belongs_to :ti_loc, optional: true, class_name: "LocImpact"
  belongs_to :ti_loi, optional: true, class_name: "LoiImpact"
  belongs_to :ti_loav, optional: true, class_name: "LoavImpact"
  belongs_to :ti_loac, optional: true, class_name: "LoacImpact"

  # business impacts
  belongs_to :bi_findam, optional: true, class_name: "FinancialDamageImpact"
  belongs_to :bi_repdam, optional: true, class_name: "ReputationDamageImpact"
  belongs_to :bi_ncomp, optional: true, class_name: "NonComplianceImpact"
  belongs_to :bi_pv, optional: true, class_name: "PrivacyViolationImpact"

  before_save :calculate_severity

  def calculate_severity
    llh = likelihood.to_f
    imp = business_impact.to_f

    if llh < 0 or imp < 0
      self.severity = -1
      return
    end

    llh = case llh
    when 0..3
      1
    when 3..7
      2
    else
      3
    end

    imp = case imp
    when 0..3
      1
    when 3..7
      2
    else
      3
    end

    self.severity = llh * imp
  end

  def threat_agent_likelihood
    return -1 if self.threat_agent.nil? or self.agent_opportunity.nil? or self.agent_motive.nil?

    v = (
      (self.threat_agent.score rescue 0).to_f + 
      (self.agent_opportunity.score rescue 0).to_f + 
      (self.agent_motive.score rescue 0).to_f
    ) / 3.0

    v.round(2)
  end

  def vf_likelihood
    return -1 if self.vf_eod.nil? or self.vf_eo_e.nil? or self.vf_awareness.nil? or self.vf_ids.nil?
    
    v = (
      (self.vf_eod.score rescue 0).to_f + 
      (self.vf_eo_e.score rescue 0).to_f + 
      (self.vf_awareness.score rescue 0).to_f + 
      (self.vf_ids.score rescue 0).to_f
    ) / 4.0

    v.round(2)
  end

  def business_impact
    return -1 if self.bi_findam.nil? or self.bi_repdam.nil? or self.bi_ncomp.nil? or self.bi_pv.nil?

    v = (
      (self.bi_findam.score rescue 0).to_f + 
      (self.bi_repdam.score rescue 0).to_f + 
      (self.bi_ncomp.score rescue 0).to_f + 
      (self.bi_pv.score rescue 0).to_f
    ) / 4.0

    v.round(2)
  end

  def technical_impact
    return -1 if self.ti_loc.nil? or self.ti_loi.nil? or self.ti_loav.nil? or self.ti_loac.nil?

    v = (
      (self.ti_loc.score rescue 0).to_f +
      (self.ti_loi.score rescue 0).to_f +
      (self.ti_loav.score rescue 0).to_f +
      (self.ti_loac.score rescue 0).to_f
    ) / 4.0

    v.round(2)
  end

  def likelihood
    score = vf_likelihood
    score+= threat_agent_likelihood
    score/= 2.0
    score.round(2)
  end

end
