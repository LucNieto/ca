class Grade < ApplicationRecord
  # virtual attributes
  attr_accessor :student, :subject
  
  belongs_to :student_has_subject
  enum grade_type: ['Departamental A', 'Departamental B', 'Parcial', 'Final A', 'Final B', 'Promedio Final']
  validates :student_has_subject_id, uniqueness: { scope: :grade_type }

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |grade|
        csv << grade.attributes.values_at(*column_names)
      end
    end
  end
end
