class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, :url => {:no_local => true, :message => "Something is up with that URL. Visit it in your browse and then copy that exact link!"}
  validates :title, presence: true
end
