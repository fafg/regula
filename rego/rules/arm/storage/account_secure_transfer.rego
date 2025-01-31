# Copyright 2021 Fugue, Inc.
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

package rules.arm_storage_account_secure_transfer

__rego__metadoc__ := {
	"id": "FG_R00152",
	"title": "Storage Accounts 'Secure transfer required' should be enabled",
	"description": "The secure transfer option enhances the security of a storage account by only allowing requests to the storage account by a secure connection. This control does not apply for custom domain names since Azure storage does not support HTTPS for custom domain names.",
	"custom": {
		"controls": {
			"CIS-Azure_v1.1.0": [
				"CIS-Azure_v1.1.0_3.1"
			],
			"CIS-Azure_v1.3.0": [
				"CIS-Azure_v1.3.0_3.1"
			]
		},
		"severity": "Medium"
	}
}

input_type = "arm"

resource_type = "Microsoft.Storage/storageAccounts"

default deny = false

deny {
	# supportsHttpsTrafficOnly defaults to true starting with api version 2019-04-01
	input.apiVersion < "2019-04-01"
	not input.properties.supportsHttpsTrafficOnly
}

deny {
	input.properties.supportsHttpsTrafficOnly == false
}
