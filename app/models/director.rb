# == Schema Information
#
# Table name: directors
#
#  id         :integer          not null, primary key
#  name       :string
#  dob        :string
#  bio        :text
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Director:
#  - name: must be present; must be unique in combination with dob
#  - dob: no rules
#  - bio: no rules
#  - image_url: no rules
 
class Director < ApplicationRecord
    
    validates(:name,:uniqueness => {:scope => :dob}, :presence =>true)#,  #,  {:presence =>true}

end
