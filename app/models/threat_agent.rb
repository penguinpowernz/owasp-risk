class ThreatAgent < ApplicationRecord
  has_many :risks
  belongs_to :skill, class_name: "AgentSkill"
  belongs_to :size, class_name: "AgentSize"

  def score
    (
      self.skill.score.to_f +
      self.size.score.to_f
    ) / 2.0
  end
end
