require "releasable/engine"

module Releasable
  ReleasableError = Class.new(StandardError)

  def self.can_release?(key, user)
    return false if key.nil?

    release = Releasable::Release.find_by(key: key)

    if release.present?
      return true if release.release_all?
      return false if user.nil?
      user_ids = release.user_ids.split(",").map(&:strip)

      raise ReleasableError, "User must have an ID" unless user.respond_to?(:id)
      return user_ids.include?(user.id.to_s)
    end

    false
  end
end
