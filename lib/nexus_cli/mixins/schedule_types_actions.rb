require 'json'

module NexusCli
  # @author Miguel Ferreira <mferreira@schubergphilis.com>
  module ScheduleTypesActions

    def get_schedule_types
      json = list_schedule_types_json
      response = nexus.get(nexus_url(get_schedule_types_api_endpoint), :body => json, :header => DEFAULT_ACCEPT_HEADER)
      case response.status
        when 200
          # return parse_list_schedule_type_response(response.content)
          return response.content
        when 400
          raise ListScheduleTypesException.new(response.content)
        else
          raise UnexpectedStatusCodeException.new(response.status)
      end
    end

    def get_schedule_types_api_endpoint
      '/service/local/schedule_types'
    end

    def list_schedule_types_json
      JSON.dump(:data => {})
    end

    def parse_list_schedule_type_response(response_content)
      parsed_json = JSON.parse(response_content)
      schedule_types = []
      parsed_json['data'].each do |schedule_type|
        schedule_types << NexusCli::ScheduleType.read_json(schedule_type);
      end
      schedule_types
    end

    private


  end
end