module UseUsersTimeZoneConcern
  extend ActiveSupport::Concern

  included do
    around_action :use_users_time_zone
  end
  
  def use_users_time_zone(&block)
    timezone = cookies[:time_zone]
    return block.call unless timezone.present?

    Time.use_zone(timezone, &block)
  end
end
