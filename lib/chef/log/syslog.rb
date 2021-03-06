#
# Author:: Lamont Granquist (<lamont@chef.io>)
# Author:: SAWANOBORI Yukihiko (<sawanoboriyu@higanworks.com>)
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

require "logger"
require "syslog-logger"
require_relative "../mixin/unformatter"
require "chef-utils/dist" unless defined?(ChefUtils::Dist)

class Chef
  class Log
    #
    # Chef::Log::Syslog class.
    # usage in client.rb:
    #  log_location Chef::Log::Syslog.new("chef-client", ::Syslog::LOG_DAEMON)
    #
    class Syslog < Logger::Syslog
      include Chef::Mixin::Unformatter

      attr_accessor :sync, :formatter

      def initialize(program_name = ChefUtils::Dist::Infra::CLIENT, facility = ::Syslog::LOG_DAEMON, logopts = nil)
        super
        return if defined? ::Logger::Syslog::SYSLOG

        ::Logger::Syslog.const_set :SYSLOG, SYSLOG
      end

      def close; end
    end
  end
end
