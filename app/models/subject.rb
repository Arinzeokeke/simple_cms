class Subject < ApplicationRecord
	has_many :pages
	validates_presence_of :name
	validates_length_of :name, :maximum => 255 


	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda{where(:visible => false)}
	scope :sorted, lambda{order("subjects.position ASC")}
	scope :search, lambda{|query|
		where (['name LIKE ?', "%#{query}%"])
	}
end
