class Constituency < Area
  belongs_to :region

  has_one :country, through: :region

  has_one :state, through: :country

  has_many :constituency_wards
  has_many :wards, through: :constituency_wards

  has_many :constituency_elections
  alias_method :elections, :constituency_elections

  has_many :elections_with_results, -> { joins(:constituency_election_result).order(election_date: :desc) }, class_name: "ConstituencyElection"

  has_one :most_recent_election_with_result, -> { joins(:constituency_election_result).order(election_date: :desc).limit(1) }, class_name: "ConstituencyElection"

  has_one :most_recent_election_result, through: :most_recent_election_with_result, source: :constituency_election_result

  def area_type
    "Constituency"
  end
end
