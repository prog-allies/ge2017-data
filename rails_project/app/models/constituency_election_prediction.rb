class ConstituencyElectionPrediction < ApplicationRecord
  belongs_to :constituency_election
  belongs_to :party
end