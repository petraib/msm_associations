# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  name       :string
#  dob        :string
#  bio        :text
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Actor:
#  - name: must be present; must be unique in combination with dob
#  - dob: no rules
#  - bio: no rules
#  - image_url: no rules
 
class Actor < ApplicationRecord
    validates(:name,:uniqueness => {:scope => :dob}, :presence =>true)#,  #,  {:presence =>true}
    
     has_many :characters
     has_many :movies, :through => :characters
end
