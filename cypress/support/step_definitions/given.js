const { Given } = require('@badeball/cypress-cucumber-preprocessor')

Given('I checkout a branch from main', () => {
  const branch = Cypress.env('BRANCH_TO_CREATE')
  cy
    .exec('git checkout main')
    .exec('git pull')
    .exec(`git branch -D ${branch} || true`)
    .exec(`git checkout -b ${branch}`)
})

Given('I create the {string} file with the next content:', (filePath, fileContent) => {
  const ccBranchName = Cypress.env('CC_BRANCH')
  const content = fileContent.replace(/<TARGET_BRANCH>/g, ccBranchName)

  cy
    .exec(`rm -f "${filePath}" || true `)
    .writeFile(filePath, content)
})

Given('I stage the file {string}', (filePath) => {
  cy.exec(`git add "${filePath}"`)
})

Given('I commit the next change {string}', (commitMsg) => {
  commitAndPushChanges([commitMsg])
})

Given('I commit the next changes', (table) => {
  const branch = Cypress.env('BRANCH_TO_CREATE')
  table
    .rows().forEach(row => {
      const commitMsg = row[0]
      if (row.length === 1) {
        cy.exec(`git commit --allow-empty -m "${commitMsg}"`)
      } else {
        const file = row[1]
        const currentTime = new Date().toISOString()
        const content = `# refresh ${currentTime}`
        cy
          .writeFile(file, content)
          .exec(`git add "${file}"`)
          .exec(`git commit -m "${commitMsg}"`)
      }
    })
  push(branch)
})

function commitAndPushChanges (commitMsgs) {
  const branch = Cypress.env('BRANCH_TO_CREATE')

  commitMsgs.forEach(commitMsg => {
    cy.exec(`git commit --allow-empty -m "${commitMsg}"`)
  })
  push(branch)
}

function push (branch) {
  cy.exec(`git push origin ${branch} --force`)
}
