class Photo < ActiveRecord::Base
  validates_presence_of :user_id, :photo
  belongs_to :user
  has_many :likes
  has_many :like_photos, :through =>:likes, :source => "user"

  #paperclip
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def find_like_by_user(user)
    self.likes.where( :user_id => user.id ).first
  end

  def can_delete_by?(current_user)
    user == current_user
  end


end