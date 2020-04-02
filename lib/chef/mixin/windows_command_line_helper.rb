#
# Author:: Kapil Chouhan (<kapil.chouhan@msystechnologies.com>)
# Copyright:: Copyright 2013-2020, Chef Software Inc.
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

require_relative "../win32/api/command_line_helper" if ChefUtils.windows?

class Chef
  module Mixin
    module WindowsCommandLineHelper

      if ChefUtils.windows?
        include Chef::ReservedNames::Win32::API::CommandLineHelper
      end

      # Splits a string into an array
      def parse_options(options)
        return Array(options) unless ChefUtils.windows?

        options.is_a?(String) ? command_line_to_argv_w_helper(options) : options
      end
    end
  end
end
