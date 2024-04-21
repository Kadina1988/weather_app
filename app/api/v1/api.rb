module V1
  class API < Grape::API
    version 'v1', using: :path

    mount Weather
  end
end
