class Song < ActiveRecord::Base
  belongs_to :user
  has_many :playlists
  validates :title, :artist, presence: true, length: { in: 2..50 }
end
