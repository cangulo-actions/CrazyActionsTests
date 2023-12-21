Cypress.Commands.add('triggerWorkflow', ({ workflowId, workflowParams }) => {
  const ghAPIUrl = Cypress.env('GH_API_URL')
  const dispatchWorkflowUrl = `${ghAPIUrl}/actions/workflows/${workflowId}/dispatches`
  const expectedCode = 204

  return cy
    .request(
      {
        method: 'POST',
        url: dispatchWorkflowUrl,
        headers: {
          Authorization: `token ${Cypress.env('GH_TOKEN')}`
        },
        body: workflowParams
      }
    )
    .then((response) => {
      return response.body
    })
})
