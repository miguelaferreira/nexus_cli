module NexusCli
  # @author Kyle Allan <kallan@riotgames.com>
  class OSSRemote < BaseRemote

    include ArtifactActions
    include GlobalSettingsActions
    include LoggingActions
    include RepositoryActions
    include UserActions
    include SchedulesActions
    include ScheduleTypesActions
  end
end