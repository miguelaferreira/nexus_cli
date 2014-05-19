require 'spec_helper'

describe NexusCli::ScheduledTaskActions do
  describe "end point" do
    expect { described_class.get_rest_api_endpoint }.to eq("/service/local/schedules")
  end
end