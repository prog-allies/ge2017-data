class ConstituencyElectionPartyRank < ApplicationRecord
  belongs_to :constituency_election

  belongs_to :party_1, class_name: "Party"
  belongs_to :party_2, class_name: "Party"
  belongs_to :party_3, class_name: "Party"
  belongs_to :party_4, class_name: "Party"
  belongs_to :party_5, class_name: "Party"
end