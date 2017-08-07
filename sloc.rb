#!/usr/bin/env ruby

require "octokit"
require "net/http"
require "uri"

print "Username: "
uname = gets.chomp
print "Password: "
pword = gets.chomp

octoclient = Octokit::Client.new(:login => uname, :password => pword)

auth = octoclient.create_authorization(:scopes => ["repo"], :note => "SLOC Script")
authid = auth.attrs[:id]
token = auth.attrs[:token]

query = Hash.new
query['query'] = IO.read('query.json')
query['variables'] = Hash.new
query['variables']['user'] = uname
query = query.to_json

uri = URI.parse("https://api.github.com/graphql")

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Post.new(uri)
request['Authorization'] = "bearer #{token}"
request['Content-type'] = "application/json"
request.body = query

data = JSON.parse(http.request(request).body)

data['data']['user']['contributedRepositories']['edges'].each do |edge|
    repo = edge['node']['nameWithOwner']
    puts repo
    stats = octoclient.contributors_stats(repo)
    add = 0
    if stats == nil
        next
    end
    stats.each do |stat|
        if stat[:author][:login] == uname
            stat[:weeks].each do |week|
                add = add + week[:a]
            end
        end
    end
    puts "Additions: #{add}"
end

octoclient.delete_authorization(authid)
