require 'sinatra'

set :bind, ENV["HOST"] || "localhost"
set :port, ENV["PORT"] || 9400

get '/metrics' do
  result = ""
  Dir.glob("scripts/*").each do |dir|
    Dir.chdir(dir) do
      result += `./metrics`
    end
  end
  result
end
