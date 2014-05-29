require 'spec_helper'


RSpec.configure do |config|
  config.before(:each) do
    stub_request(:post, /localhost/).
        with(headers: {'Accept'=>'*/*'}).
        to_return(status: 201, body: '', headers: {})
  end
end

describe NexusCli::SchedulesActions do
  let(:dummy_instance) { (Class.new { include NexusCli::SchedulesActions }).new }
  
  describe "get_rest_api_endpoint" do
    it "returns the correct REST endpoint" do
      dummy_instance.get_rest_api_endpoint.should be_a(String)
      dummy_instance.get_rest_api_endpoint.should eql('/service/local/schedules')
    end
  end
  
  describe "create_scheduled_task_json" do
    it "should contain specified fields" do
      json = dummy_instance.create_scheduled_task_json('name', 'type id', true, 'email address',  [{:key => 'key1', :value => 'value1'}], 'tomorrow')

      json.should include("\"data\":")
      json.should include("\"typeId\":\"type id\"")
      json.should include("\"enabled\":true")
      json.should include("\"alertEmail\":\"email address\"")
      json.should include("\"name\":\"name\"")
      json.should include("\"properties\":[{\"scheduled-task-property\":{\"key\":\"key1\",\"value\":\"value1\"}}]")
      json.should include("\"schedule\":\"tomorrow\"")
    end
  end

  describe "create_scheduled_task" do
    it "should produce a list of types" do
      remote = NexusCli::OSSRemote.new(
          'url' => 'http://localhost:8081/nexus',
          'repository' => 'releases',
          'username' => 'admin',
          'password' => 'admin123'
      )
      remote.create_scheduled_task('name', 'type id', true, 'email address',  [{:key => 'key1', :value => 'value1'}], 'tomorrow').should eql(true)
    end
  end

end