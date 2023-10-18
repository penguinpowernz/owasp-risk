json.extract! risk, :id, :name, :desc, :threat_agent_id, :vulnerability_factor_id, :technical_impact_id, :business_impact_id, :created_at, :updated_at
json.url risk_url(risk, format: :json)
