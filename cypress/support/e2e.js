const consoleReporter = require('cypress-terminal-report/src/installLogsCollector')

consoleReporter()

// commands
require('cypress-wait-until')
require('./commands/gh-api-commits')
require('./commands/gh-api-workflows')
require('./commands/gh-api-pulls')
