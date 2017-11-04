module Releasable
  module ReleasableHelper
    def releasable?(key, user)
      Releasable.can_release?(key, user)
    end
  end
end
