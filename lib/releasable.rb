require "releasable/engine"

module Releasable
  ReleasableError = Class.new(StandardError)

  def self.can_release?(key, user)
    return false if user.nil? || key.nil?
    raise ReleasableError, "User must have an ID" unless user.respond_to?(:id)

    release = Releasable::Release.find_by(key: key)

    if release.present?
      user_ids = release.user_ids.split(",").map(&:strip)
      return user_ids.include?(user.id.to_s)
    end

    false
  end
end
