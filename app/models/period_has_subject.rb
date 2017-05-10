class PeriodHasSubject < ApplicationRecord
  belongs_to :period
  belongs_to :teacher
  belongs_to :subject




end
