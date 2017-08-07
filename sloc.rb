#!/usr/bin/env ruby

require "octokit"
require "net/http"
require "uri"

print "Username: "
uname = gets.chomp
print "Password: "
pword = gets.chomp

octoclient = Octokit::Client.new(:login => uname, :password => pword)

token = octoclient.create_authorization(:scopes => ["public_repo", "user"], :note => "SLOC Script").attrs[:token]

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

repos = JSON.parse(http.request(request).body)

puts repos.inspect
