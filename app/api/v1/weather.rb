module V1
  class Weather < Grape::API
    CITY = 'miami'

    before do
      def client
        @client ||= ::AccoeWeather::Client.new('weather app')
      end

      def uniq_id
        @uniq_id ||= @client.uniq_id(city: CITY).uniq_id
      end

    end

    resource :weather do
      desc 'get current temperature'
      get '/current' do
        result = client.current_temperature(uniq_id:)

        present '200'
      end
    end
  end
end
