# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  year        :integer
#  duration    :integer
#  description :text
#  image_url   :string
#  director_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Movie:
#  - director_id: must be present
#  - title: must be present; must be unique in combination with year
#  - year: must be integer between 1870 and 2050
#  - duration: must be integer between 0 and 2764800, but it can be blank (hint: there is an option `:allow_blank => true`)
#  - description: no rules
#  - image_url: no rules

class Movie < ApplicationRecord
        validates(:director_id, {:presence =>true})
        #validates(:name,:uniqueness => {:scope => :dob}, :presence =>true)#,  #,  {:presence =>true}
        validates(:title, :presence =>true, :uniqueness => {:scope => :year})
        validates(:year, :numericality => { greater_than: 1870, less_than: 2050 })
        validates(:duration, :numericality => { greater_than: 0, less_than: 2764800 }, :allow_blank=>true )


    
end



