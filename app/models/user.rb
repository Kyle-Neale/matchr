class User < ActiveRecord::Base
  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: "Friendship" , foreign_key: "friend_id",dependent: :destroy

  has_attached_file :avatar,
    :styles => {:medium => "370x370", :thumb => "100x100"},
    :storage => :s3,
    :path => ":class/:id/:style/:filename",
    :url => ':s3_domain_url'


  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


  def self.sign_in_from_facebook(auth)
    find_by(provider: auth['provider'] , uid: auth['uid']) || create_user_from_facebook(auth)
  end

  def self.create_user_from_facebook(auth)

    create ( {
               avatar: process_uri(auth['info'][:image] + "?width=999999"),
               email: auth[:info][:email],
               provider: auth['provider'],
               uid: auth['uid'],
               name: auth['info'][:name],
               gender: auth[:extra][:raw_info][:gender],
               date_of_birth:  auth[:extra][:raw_info][:age_range][:min],
               location: auth[:info][:location],
               bio: auth[:extra][:raw_info][:bio]
    })
  end

  def request_match(user2)
    self.friendships.create(friend: user2)

  end

  def accept_match(user2)
    self.friendships.where(friend: user2).first.update_attribute(:state, "ACTIVE")
  end

  def remove_match(user2)
    inverse_friendship = inverse_friendships.where(user_id: user2).first

    if inverse_friendship
      self.inverse_friendships.where(user_id: user2).first.destroy
    else
      self.friendships.where(friend_id: user2).first.destroy
    end
  end

  #filter methods
  def self.gender(user)
    case user.interest
    when "Male"
      where('gender = ?', 'male')
    when "Female"
      where('gender = ?', 'female')
    else
      all
    end


  end

  def self.not_me(user)
    where.not(id: user.id)
  end

  def matches(current_user)
    friendships.where(state: "pending").map(&:friend) + current_user.friendships.where(state: "ACTIVE").map(&:friend) + current_user.inverse_friendships.where(state: "ACTIVE").map(&:user) 
  end

  def find_friendship(current_user, user)
    Friendship.where(user_id: current_user.id, friend_id: user.id).first ||  Friendship.where(user_id: user.id, friend_id: current_user.id).first
  end
  private
  def self.process_uri(uri)
    avatar_url = URI.parse(uri)
    avatar_url.scheme = 'https'
    avatar_url.to_s
  end
end
