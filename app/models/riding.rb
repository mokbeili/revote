class Riding < ApplicationRecord
  has_many :candidates
  has_many :ridings
  # has_many :current_ridings, :class_name => "Ticket", :foreign_key => "current_riding"
  # has_many :hypothetical_ridings, :class_name => "Ticket", :foreign_key => "hypothetical_riding"

end
