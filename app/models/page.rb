class Page < ActiveRecord::Base
  attr_accessible :about_content, :about_title, :contact_content, :contact_title
end
