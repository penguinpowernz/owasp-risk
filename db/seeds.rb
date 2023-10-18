# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Business Impact Factors
# ---
# The business impact stems from the technical impact, but requires a deep understanding
# of what is important to the company running the application. In general, you should be
# aiming to support your risks with business impact, particularly if your audience is
# executive level. The business risk is what justifies investment in fixing security problems.
#
# Many companies have an asset classification guide and/or a business impact reference to
# help formalize what is important to their business. These standards can help you focus 
# on what’s truly important for security. If these aren’t available, then it is necessary
# to talk with people who understand the business to get their take on what’s important.
#
# The factors below are common areas for many businesses, but this area is even more unique
# to a company than the factors related to threat agent, vulnerability, and technical impact.

# Financial damage - How much financial damage will result from an exploit? Less than the cost to fix the vulnerability (1), minor effect on annual profit (3), significant effect on annual profit (7), bankruptcy (9)
{
  "Less than the cost to fix the vulnerability" => 1,
  "minor effect on annual profit" => 3,
  "significant effect on annual profit" => 7,
  "bankruptcy" => 9,
}.each do |name, score|
  FinancialDamageImpact.find_or_create_by(name: name, score: score)
end

# Reputation damage - Would an exploit result in reputation damage that would harm the business? Minimal damage (1), Loss of major accounts (4), loss of goodwill (5), brand damage (9)
{
  "Minimal damage" => 1,
  "Loss of major accounts" => 4,
  "Loss of goodwill" => 5,
  "Brand damage" => 9
}.each do |name, score|
  ReputationDamageImpact.find_or_create_by(name: name, score: score)
end

# Non-compliance - How much exposure does non-compliance introduce? Minor violation (2), clear violation (5), high profile violation (7)
{
  "Minor violation" => 2,
  "Clear violation" => 5,
  "High profile violation" => 7
}.each do |name, score|
  NonComplianceImpact.find_or_create_by(name: name, score: score)
end

# Privacy violation - How much personally identifiable information could be disclosed? One individual (3), hundreds of people (5), thousands of people (7), millions of people (9)
{
  "One individual" => 3,
  "Hundreds of people" => 5,
  "Thousands of people" => 7,
  "Millions of people" => 9
}.each do |name, score|
  PrivacyViolationImpact.find_or_create_by(name: name, score: score)
end

# Technical Impact Factors
# ---
# Technical impact can be broken down into factors aligned with the traditional 
# security areas of concern: confidentiality, integrity, availability, and 
# accountability. The goal is to estimate the magnitude of the impact on the 
# system if the vulnerability were to be exploited.

# Loss of Confidentiality - How much data could be disclosed and how sensitive is it? Minimal non-sensitive data disclosed (2), minimal critical data disclosed (6), extensive non-sensitive data disclosed (6), extensive critical data disclosed (7), all data disclosed (9)
{
  "Minimal non-sensitive data disclosed" => 2,
  "Minimal critical data disclosed" => 6,
  "Extensive non-sensitive data disclosed" => 6,
  "Extensive critical data disclosed" => 7,
  "All data disclosed" => 9
}.each do |name, score|
  LocImpact.find_or_create_by(name: name, score: score)
end

# Loss of Integrity - How much data could be corrupted and how damaged is it? Minimal slightly corrupt data (1), minimal seriously corrupt data (3), extensive slightly corrupt data (5), extensive seriously corrupt data (7), all data totally corrupt (9)
{
  "Minimal slightly corrupt data" => 1,
  "Minimal seriously corrupt data" => 3,
  "Extensive slightly corrupt data" => 5,
  "Extensive seriously corrupt data" => 7,
  "All data totally corrupt" => 9
}.each do |name, score|
  LoiImpact.find_or_create_by(name: name, score: score)
end

# Loss of Availability - How much service could be lost and how vital is it? Minimal secondary services interrupted (1), minimal primary services interrupted (5), extensive secondary services interrupted (5), extensive primary services interrupted (7), all services completely lost (9)
{
  "Minimal secondary services interrupted" => 1,
  "Minimal primary services interrupted" => 5,
  "Extensive secondary services interrupted" => 5,
  "Extensive primary services interrupted" => 7,
  "All services completely lost" => 9
}.each do |name, score|
  LoavImpact.find_or_create_by(name: name, score: score)
end

# Loss of Accountability - Are the threat agents’ actions traceable to an individual? Fully traceable (1), possibly traceable (7), completely anonymous (9)
{
  "Fully traceable" => 1,
  "Possibly traceable" => 7,
  "Completely anonymous" => 9
}.each do |name, score|
  LoacImpact.find_or_create_by(name: name, score: score)
end

# Vulnerability Factors
# ---
# The next set of factors are related to the vulnerability involved. The goal here is to
# estimate the likelihood of the particular vulnerability involved being discovered and 
# exploited. Assume the threat agent selected above.

# Ease of Discovery - How easy is it for this group of threat agents to discover this vulnerability? Practically impossible (1), difficult (3), easy (7), automated tools available (9)
{
  "Practically impossible" => 1,
  "Difficult" => 3,
  "Easy" => 7,
  "Automated tools available" => 9
}.each do |name, score|
  VulnerabilityEod.find_or_create_by(name: name, score: score)
end

# Ease of Exploit - How easy is it for this group of threat agents to actually exploit this vulnerability? Theoretical (1), difficult (3), easy (5), automated tools available (9)
{
  "Theoretical" => 1,
  "Difficult" => 3,
  "Easy" => 5,
  "Automated tools available" => 9
}.each do |name, score|
  VulnerabilityEoE.find_or_create_by(name: name, score: score)
end

# Awareness - How well known is this vulnerability to this group of threat agents? Unknown (1), hidden (4), obvious (6), public knowledge (9)
{
  "Unknown" => 1,
  "Hidden" => 4,
  "Obvious" => 6,
  "Public knowledge" => 9
}.each do |name, score|
  VulnerabilityAwareness.find_or_create_by(name: name, score: score)
end

# Intrusion Detection - How likely is an exploit to be detected? Active detection in application (1), logged and reviewed (3), logged without review (8), not logged (9)
{
  "Active detection in application" => 1,
  "Logged and reviewed" => 3,
  "Logged without review" => 8,
  "Not logged" => 9
}.each do |name, score|
  VulnerabilityId.find_or_create_by(name: name, score: score)
end

# Threat Agent Factors
# The first set of factors are related to the threat agent involved. The goal here is to 
# estimate the likelihood of a successful attack by this group of threat agents. Use the 
# worst-case threat agent.

# Skill Level - How technically skilled is this group of threat agents? No technical skills (1), some technical skills (3), advanced computer user (5), network and programming skills (6), security penetration skills (9)
{
  "No technical skills" => 1,
  "Some technical skills" => 3,
  "Advanced computer user" => 5,
  "Network and programming skills" => 6,
  "Security penetration skills" => 9
}.each do |name, score|
  AgentSkill.find_or_create_by(name: name, score: score)
end

# Motive - How motivated is this group of threat agents to find and exploit this vulnerability? Low or no reward (1), possible reward (4), high reward (9)
{
  "Low or no reward" => 1,
  "Possible reward" => 4,
  "High reward" => 9
}.each do |name, score|
  AgentMotive.find_or_create_by(name: name, score: score)
end

# Opportunity - What resources and opportunities are required for this group of threat agents to find and exploit this vulnerability? Full access or expensive resources required (0), special access or resources required (4), some access or resources required (7), no access or resources required (9)
{
  "Full access or expensive resources required" => 0,
  "Special access or resources required" => 4,
  "Some access or resources required" => 7,
  "No access or resources required" => 9
}.each do |name, score|
  AgentOpportunity.find_or_create_by(name: name, score: score)
end

# Size - How large is this group of threat agents? Developers (2), system administrators (2), intranet users (4), partners (5), authenticated users (6), anonymous Internet users (9)
{
  "Developers" => 2,
  "System administrators" => 2,
  "Department" => 3,
  "Intranet users" => 4,
  "Partners" => 5,
  "Authenticated users" => 6,
  "Anonymous Internet users" => 9
}.each do |name, score|
  AgentSize.find_or_create_by(name: name, score: score)
end

# Basic Threat Actors
# ---
#

ThreatAgent.create(
  name: "State Sponsored Espionage",
  size: AgentSize.find_by_score(3),
  skill: AgentSkill.find_by_score(9)
)

ThreatAgent.create(
  name: "Script kiddies",
  size: AgentSize.find_by_score(9),
  skill: AgentSkill.find_by_score(6)
)
