#
# Author:: Tim Smith (<tsmith@chef.io>)
# Copyright:: Copyright (c) Chef Software Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "spec_helper"
require "support/shared/unit/resource/static_provider_resolution"

describe Chef::Resource::BffPackage, "initialize" do

  static_provider_resolution(
    resource: Chef::Resource::BffPackage,
    provider: Chef::Provider::Package::Bff,
    name: :bff_package,
    action: :install,
    os: "linux",
    platform_family: "aix"
  )

end

describe Chef::Resource::BffPackage, "defaults" do
  let(:resource) { Chef::Resource::BffPackage.new("fakey_fakerton") }

  it "sets the default action as :install" do
    expect(resource.action).to eql([:install])
  end

  it "supports :install, :lock, :purge, :reconfig, :remove, :unlock, :upgrade actions" do
    expect { resource.action :install }.not_to raise_error
    expect { resource.action :lock }.not_to raise_error
    expect { resource.action :purge }.not_to raise_error
    expect { resource.action :reconfig }.not_to raise_error
    expect { resource.action :remove }.not_to raise_error
    expect { resource.action :unlock }.not_to raise_error
    expect { resource.action :upgrade }.not_to raise_error
  end
end
