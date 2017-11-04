FactoryBot.define do
  factory :release, class: Releasable::Release do
    user_ids "1,2,3,4,5,6"
  end
end
