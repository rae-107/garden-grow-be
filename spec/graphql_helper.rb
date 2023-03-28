module GraphqlHelper
  def gql(query)
    body = { query: query }

    post '/api/v1/graphql', params: body

    JSON.parse(response.body, symbolize_names: true)
  end
end
