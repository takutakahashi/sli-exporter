require "net/http"
require "faraday"

class NewRelicInsightsClient
  def exec(nrql:)
    endpoint = ENV["NEWRELIC_INSIGHTS_API_URL"]
    key = ENV["NEWRELIC_INSIGHTS_API_KEY"]
  
    headers = {
      "Accept": "application/json",
      "X-Query-Key": key,
    }
  
    params = {
      "nrql": nrql,
    }

    conn = Faraday::Connection.new(url: endpoint) do |builder|
      builder.use Faraday::Request::UrlEncoded
      builder.adapter Faraday::Adapter::NetHttp
    end

    return conn.get '' do |req|
      req.params = params
      req.headers = headers
    end
  end
end

