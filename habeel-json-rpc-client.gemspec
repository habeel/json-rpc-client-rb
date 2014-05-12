Gem::Specification.new do |s|
  s.name        = "habeel-json-rpc-client"
  s.version     = "0.2"
  s.date        = "2014-03-31"
  s.summary     = "Simple JSON RPC Client"
  s.description = "Very simple JSON RPC Client with minimum dependencies"
  s.authors     = ["Habeel Ahmed"]
  s.email       = 'habeel@atlasats.com'
  s.files       = ["lib/client.rb"]
  s.homepage    = 'https://github.com/habeel/json-rpc-client-rb'
  s.license     = 'GPLv2'
  s.add_runtime_dependency 'json', '~> 1.8'
  s.add_runtime_dependency 'rest-client', '~> 1.6'
end
