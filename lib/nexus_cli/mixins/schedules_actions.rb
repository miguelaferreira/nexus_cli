require 'json'

module NexusCli
  # @author Miguel Ferreira <mferreira@schubergphilis.com>
  module SchedulesActions

    def create_scheduled_task(name, type_id, enabled, alert_email, schedule)
      json = create_scheduled_task_json(name, type_id, enabled, alert_email, schedule)
      response = nexus.post(nexus_url(get_schedules_api_endpoint), :body => json, :header => DEFAULT_CONTENT_TYPE_HEADER)
      case response.status
        when 201
          return true
        when 400
          raise CreateScheduledTaskException.new(response.content)
        else
          raise UnexpectedStatusCodeException.new(response.status)
      end
    end

    def get_schedules
      json = get_schedules_json
      response = nexus.get(nexus_url(get_schedules_api_endpoint), :body => json, :header => DEFAULT_ACCEPT_HEADER)
      case response.status
        when 200
          return response.content
        when 400
          raise GetSchedulesTaskException.new(response.content)
        else
          raise UnexpectedStatusCodeException.new(response.status)
      end
    end

    def get_schedules_api_endpoint
      '/service/local/schedules'
    end

    def create_scheduled_task_json(name, type_id, enabled, alert_email, schedule)
      params = {}
      params[:typeId] = type_id
      params[:enabled] = enabled
      params[:alertEmail] = alert_email
      params[:name] = name
      params[:schedule] = schedule
      JSON.dump(:data => params)
    end

    def get_schedules_json
      JSON.dump({})
    end

    private

  end

end