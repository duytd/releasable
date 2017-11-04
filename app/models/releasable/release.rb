module Releasable
  class Release < ActiveRecord::Base
    validates :key, presence: true, uniqueness: true
    validates :user_ids, presence: true

    before_validation :generate_key, on: :create

    private

    def generate_key
      self.key = loop do
        random_uuid = SecureRandom.uuid
        break random_uuid unless Release.exists?(key: random_uuid)
      end
    end
  end
end
