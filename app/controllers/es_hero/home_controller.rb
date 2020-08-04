module EsHero
  class HomeController < ActionController::Base
    layout false

    protect_from_forgery with: :exception

    http_basic_authenticate_with name: ENV["ESHERO_USERNAME"], password: ENV["ESHERO_PASSWORD"] if ENV["ESHERO_PASSWORD"]

    def index
      @nodes = EsHero.nodes
      @indices = EsHero.indices
    end
  end
end
