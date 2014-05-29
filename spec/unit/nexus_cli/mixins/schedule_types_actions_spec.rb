require 'spec_helper'

json_response = '{
  "data":[
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
    },
    {
      "id":"EmptyTrashTask",
      "name":"Empty Trash",
      "formFields":[
        {
          "id":"repositoryId",
          "type":"repo-or-group",
          "label":"Repository/Group",
          "helpText":"Select the repository or repository group",
          "required":true,
          "storePath":"/service/local/repositories",
          "storeRoot":"data"
        },
        {
          "id":"EmptyTrashItemsOlderThan",
          "type":"number",
          "label":"Purge items older than (days)",
          "helpText":"Set the number of days, to purge all items that were trashed before the given number of days.",
          "required":false
        }
      ]
    },
    {
      "id":"EvictUnusedProxiedItemsTask",
      "name":"Evict Unused Proxied Items From Repository Caches",
      "formFields":[
        {
          "id":"repositoryId",
          "type":"repo-or-group",
          "label":"Repository/Group",
          "helpText":"Select the repository or repository group",
          "required":true,
          "storePath":"/service/local/repositories",
          "storeRoot":"data"
        },
        {
          "id":"evictOlderCacheItemsThen",
          "type":"number",
          "label":"Evict items older than (days)",
          "helpText":"Set the number of days, to evict all unused proxied items that were not used the given number of days.",
          "required":true
        }
      ]
    },
    {
      "id":"ExpireCacheTask",
      "name":"Expire Repository Caches",
      "formFields":[
        {
          "id":"repositoryId",
          "type":"repo-or-group",
          "label":"Repository/Group",
          "helpText":"Type in the repository path from which to expire caches recursively (ie. \"/\" for root or \"/org/apache\").",
          "required":true,
          "storePath":"/service/local/repositories",
          "storeRoot":"data"
        },
        {
          "id":"resourceStorePath",
          "type":"string",
          "label":"Repository path",
          "helpText":"Enter a repository path to run the task in recursively (ie. \"/\" for root or \"/org/apache\").",
          "required":false
        }
      ]
    },
    {
      "id":"OptimizeIndexTask",
      "name":"Optimize Repository Index",
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
    },
    {
      "id":"PublishIndexesTask",
      "name":"Publish Indexes",
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
    },
    {
      "id":"PurgeTimeline",
      "name":"Purge Nexus Timeline",
      "formFields":[
        {
          "id":"purgeOlderThan",
          "type":"number",
          "label":"Purge items older than (days)",
          "helpText":"Set the number of days, to purge all items that were trashed before the given number of days.",
          "required":true
        }
      ]
    },
    {
      "id":"PurgeApiKeysTask",
      "name":"Purge Orphaned API Keys",
      "formFields":[

      ]
    },
    {
      "id":"RebuildMavenMetadataTask",
      "name":"Rebuild Maven Metadata Files",
      "formFields":[
        {
          "id":"repositoryId",
          "type":"repo-or-group",
          "label":"Repository/Group",
          "helpText":"Select the repository or repository group",
          "required":true,
          "storePath":"/service/local/repositories",
          "storeRoot":"data"
        },
        {
          "id":"resourceStorePath",
          "type":"string",
          "label":"Repository path",
          "helpText":"Enter a repository path to run the task in recursively (ie. \"/\" for root or \"/org/apache\").",
          "required":false
        }
      ]
    },
    {
      "id":"ReleaseRemoverTask",
      "name":"Remove Releases From Repository",
      "formFields":[
        {
          "id":"repositoryId",
          "type":"repo",
          "label":"Repository",
          "helpText":"Select the repository or repository group.",
          "required":true,
          "storePath":"/service/local/repositories",
          "storeRoot":"data"
        },
        {
          "id":"numberOfVersionsToKeep",
          "type":"number",
          "label":"Number to keep",
          "helpText":"The number of versions for each GA to keep",
          "required":true
        },
        {
          "id":"repositoryTarget",
          "type":"repo-target",
          "label":"Repository Target",
          "helpText":"Select a repository target to apply",
          "required":false,
          "storePath":"/service/local/repo_targets",
          "storeRoot":"data"
        }
      ]
    },
    {
      "id":"SnapshotRemoverTask",
      "name":"Remove Snapshots From Repository",
      "formFields":[
        {
          "id":"repositoryId",
          "type":"repo-or-group",
          "label":"Repository/Group",
          "helpText":"Select the repository or repository group",
          "required":true,
          "storePath":"/service/local/repositories",
          "storeRoot":"data"
        },
        {
          "id":"minSnapshotsToKeep",
          "type":"number",
          "label":"Minimum snapshot count",
          "helpText":"Minimum number of snapshots to keep for one GAV.",
          "required":true
        },
        {
          "id":"removeOlderThanDays",
          "type":"number",
          "label":"Snapshot retention (days)",
          "helpText":"The job will purge all snapshots older than the entered number of days, but will obey to Min. count of snapshots to keep.",
          "required":true
        },
        {
          "id":"removeIfReleaseExists",
          "type":"checkbox",
          "label":"Remove if released",
          "helpText":"The job will purge all snapshots that have a corresponding released artifact (same version not including the -SNAPSHOT).",
          "required":false
        },
        {
          "id":"graceDaysAfterRelease",
          "type":"number",
          "label":"Grace period after release (days)",
          "helpText":"The grace period (in days) that the task will not purge all snapshots that have a corresponding released artifact.",
          "required":false
        },
        {
          "id":"deleteImmediately",
          "type":"checkbox",
          "label":"Delete immediately",
          "helpText":"The job will not move deleted items into the repository trash but delete immediately.",
          "required":false
        }
      ]
    },
    {
      "id":"UnusedSnapshotRemoverTask",
      "name":"Remove Unused Snapshots From Repository",
      "formFields":[
        {
          "id":"repositoryId",
          "type":"repo-or-group",
          "label":"Repository/Group",
          "helpText":"Select the repository or repository group",
          "required":true,
          "storePath":"/service/local/repositories",
          "storeRoot":"data"
        },
        {
          "id":"daysSinceLastRequested",
          "type":"number",
          "label":"Days since last requested",
          "helpText":"The job will purge all snapshots that were last time requested from Nexus before the specified number of days",
          "required":true
        }
      ]
    },
    {
      "id":"RepairIndexTask",
      "name":"Repair Repositories Index",
      "formFields":[
        {
          "id":"repositoryId",
          "type":"repo-or-group",
          "label":"Repository/Group",
          "helpText":"Select the repository or repository group",
          "required":true,
          "storePath":"/service/local/repositories",
          "storeRoot":"data"
        },
        {
          "id":"resourceStorePath",
          "type":"string",
          "label":"Repository path",
          "helpText":"Enter a repository path to run the task in recursively (ie. \"/\" for root or \"/org/apache\").",
          "required":false
        }
      ]
    },
    {
      "id":"SynchronizeShadowsTask",
      "name":"Synchronize Shadow Repository",
      "formFields":[
        {
          "id":"shadowRepositoryId",
          "type":"repo",
          "label":"Shadow Repository",
          "helpText":"Select the repository shadow to assign to this task.",
          "required":true,
          "storePath":"/service/local/repositories",
          "storeRoot":"data"
        }
      ]
    },
    {
      "id":"UpdateIndexTask",
      "name":"Update Repositories Index",
      "formFields":[
        {
          "id":"repositoryId",
          "type":"repo-or-group",
          "label":"Repository/Group",
          "helpText":"Select the repository or repository group",
          "required":true,
          "storePath":"/service/local/repositories",
          "storeRoot":"data"
        },
        {
          "id":"resourceStorePath",
          "type":"string",
          "label":"Repository path",
          "helpText":"Enter a repository path to run the task in recursively (ie. \"/\" for root or \"/org/apache\").",
          "required":false
        }
      ]
    },
    {
      "id":"GenerateMetadataTask",
      "name":"Yum: Generate Metadata",
      "formFields":[
        {
          "id":"repoId",
          "type":"repo",
          "label":"Repository for createrepo",
          "helpText":"Maven Repository for which the yum metadata is generated via createrepo.",
          "required":true,
          "storePath":"/service/local/repositories",
          "storeRoot":"data"
        },
        {
          "id":"repoDir",
          "type":"string",
          "label":"Optional Output Directory",
          "helpText":"Directory which should contain the yum metadata after generation. If not set, yum will generate the metadata into the root directory of the selected repository.",
          "required":false
        }
      ]
    }
  ]
}'

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, /localhost/).
        with(:body => "{\"data\":{}}",
             :headers => {'Accept'=>'application/json'}).
        to_return(:status => 200, :body => json_response, :headers => {})
  end
end

describe NexusCli::ScheduleTypesActions do
  let(:dummy_instance) { (Class.new { include NexusCli::ScheduleTypesActions }).new }

  describe 'get_schedule_types_api_endpoint' do
    it 'returns the correct REST endpoint' do
      rest_endpoint = dummy_instance.get_schedule_types_api_endpoint
      rest_endpoint.should be_a(String)
      rest_endpoint.should include('schedule_types')
    end
  end

  describe 'get_schedule_types_json' do
    it 'should have no fields' do
      dummy_instance.list_schedule_types_json.should include("\"data\":{}")
    end
  end

  describe 'get_scheduled_types' do
    it 'should produce a list of types' do
      remote = NexusCli::OSSRemote.new(
          'url' => 'http://localhost:8081/nexus',
          'repository' => 'releases',
          'username' => 'admin',
          'password' => 'admin123'
      )

      remote.get_schedule_types.should_not be_empty
    end
  end

  describe 'parse_list_schedule_type_response' do
    it 'should not return a array of arrays' do
      schedule_types = dummy_instance.parse_list_schedule_type_response(json_response)

      schedule_types.should be_a(Array)
      schedule_types.should have(16).items
      schedule_types.each do |schedule_type|
        schedule_type.should be_a(NexusCli::ScheduleType)
      end
    end
  end

end