require 'spec_helper'

describe NexusCli::ScheduleType do

  before :each do
    @schedule_type = NexusCli::ScheduleType.new("id", [NexusCli::Field.new("label", true, "type")])
  end

  it 'should have an id' do
    @schedule_type.id.should eql("id")
  end

  it 'should have an one field' do
    @schedule_type.fields.should have(1).items
  end

  it 'should be parseable from a JSON string with only one field' do
    json_text = '
    {
      "id":"DownloadIndexesTask",
      "name":"Download Indexes",
      "formFields":[
        {
          "id":"repositoryId",
          "type":"repo-or-group",
          "label":"Repository/Group",
          "helpText":"Select the repository or repository group",
          "required":true,
          "storePath":"/service/local/repositories",
          "storeRoot":"data"
        }
      ]
    }'

    schedule_type = NexusCli::ScheduleType.read_json(JSON.parse(json_text))
    schedule_type.id.should eql('DownloadIndexesTask')
    schedule_type.fields.should have(1).items
  end

end

describe NexusCli::Field do

  before :each do
    @field = NexusCli::Field.new('label', true, 'type')
  end

  it 'should have a label' do
    @field.label.should eql('label')
  end

  it 'should be required' do
    @field.is_required.should eql(true)
  end

  it 'should have a type' do
    @field.type.should eql('type')
  end

  it 'should be parseable from a JSON object' do
    json_text = '
    {
      "id": "repositoryId",
      "type": "repo-or-group",
      "label": "Repository/Group",
      "helpText": "Select the repository or repository group",
      "required": "true",
      "storePath": "/service/local/repositories",
      "storeRoot": "data"
    }'

    field = NexusCli::Field.read_json(JSON.parse(json_text))
    field.label.should eql('Repository/Group')
    field.is_required.should eql(true)
    field.type.should eql('repo-or-group')
  end

end
