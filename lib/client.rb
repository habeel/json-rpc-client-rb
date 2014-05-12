require 'rubygems'
require 'bundler/setup'
require 'rest-client'
require 'json'

module Habeel
	module JsonRPC
		class Client
			def self.make_id
				rand(10**12)
			end

			def initialize(url, opts = {})
				@url = url
				@opts = opts || {}
				@opts[:content_type] = "application/json"
			end

			def method_missing(method, *args)
				post_data = {
					:jsonrpc => '2.0',
					:method => method,
					:params => args,
					:id => self.class.make_id
				}.to_json

				resp = RestClient::Request.execute(:method => :post, :url => @url, :payload => post_data, :headers => @opts, :timeout => 300, :open_timeout => 300)

				body = JSON.parse(resp.body)
				return body['result']
			end
		end
	end
end
