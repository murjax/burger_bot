Elasticsearch::Model.client = Elasticsearch::Client.new host: ENV['ELASTICSEARCH_HOST'], port: 9200
