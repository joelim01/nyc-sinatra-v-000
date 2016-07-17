class Landmark <ActiveRecord::Base
 belongs_to :figure
 validates_presence_of :name
end
