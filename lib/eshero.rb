require "eshero/version"
require "elasticsearch"
require "eshero/engine" if defined?(Rails)

module EsHero

  def self.indices
    aliases = client.indices.get_aliases
    client.indices.stats["indices"].map do |name, info|
      {
        name: name,
        docs: info["total"]["docs"]["count"],
        size: info["total"]["store"]["size_in_bytes"],
        aliases: (aliases[name]["aliases"] || {}).keys
      }
    end.sort_by{|index| [-index[:size], index[:name]] }
  end

  def self.nodes
    client.nodes.stats["nodes"].map do |name, info|
      {
        name: info["name"],
        connections: info["http"]["current_open"],
        cpu: info["os"]["cpu"]["usage"]
      }
    end
  end

  def self.client
    @client ||= Elasticsearch::Client.new(url: ENV["ESHERO_ELASTICSEARCH_URL"] || ENV["ELASTICSEARCH_URL"])
  end

end
