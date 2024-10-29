/* Copyright 2024 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License
 */
const {basename} = require('path');

/**
 * @fileoverview Rule which triggers when the CPU utilization is high based
 * on average cpu > 70% and max cpu > 75%
 *
 * @type {import('json-rules-engine').RuleProperties}
 */
module.exports = {
  name: basename(__filename, '.js'),
  conditions: {
    all: [
      {
        fact: 'cpu_maximum_utilization',
        operator: 'greaterThan',
        value: 75,
      },
      {
        fact: 'cpu_average_utilization',
        operator: 'greaterThan',
        value: 70,
      },
    ],
  },
  event: {
    type: 'OUT',
    params: {
      message: 'high maximum CPU utilization',
      scalingMetrics: ['cpu_maximum_utilization'],
    },
  },
};
