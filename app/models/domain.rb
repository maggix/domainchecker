class Domain < ActiveRecord::Base
  require 'uri'

  belongs_to :user

  validates :host, :presence => true
  validate :good_url



  # validates :terms_of_service, acceptance: true
  protected
  def good_url
    errors.add(:host, 'not valid') unless URI.parse(host)
    errors.add(:host, 'must begin with https://') unless host =~ /^https?:\/\//
  end

end
