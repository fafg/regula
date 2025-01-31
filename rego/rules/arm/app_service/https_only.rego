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

package rules.arm_app_service_https_only

import data.fugue

__rego__metadoc__ := {
	"id": "FG_R00346",
	"title": "App Service web apps should have 'HTTPS only' enabled",
	"description": "Azure Web Apps allows sites to run under both HTTP and HTTPS by default. Web apps can be accessed by anyone using non-secure HTTP links by default. Non-secure HTTP requests can be restricted and all HTTP requests redirected to the secure HTTPS port. It is recommended to enforce HTTPS-only traffic.",
	"custom": {
		"controls": {
			"CIS-Azure_v1.1.0": [
				"CIS-Azure_v1.1.0_9.2"
			],
			"CIS-Azure_v1.3.0": [
				"CIS-Azure_v1.3.0_9.2"
			]
		},
		"severity": "High"
	}
}

input_type = "arm"

resource_type = "Microsoft.Web/sites"

default allow = false

allow {
	input.properties.httpsOnly == true
}
