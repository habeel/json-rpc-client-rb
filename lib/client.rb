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

				resp = RestClient.post(@url, post_data, @opts)

				body = JSON.parse(resp.body)
				return body['result']
			end
		end
	end
end
