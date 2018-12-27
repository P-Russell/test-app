module FakeUserDataHelper
    require 'faraday'
    require 'json'

    def self.get_data

        conn = Faraday.new(:url => 'https://reqres.in')
        response = conn.get('/api/users', {'page': '1'})
        users = []

        if response.status == 200
            parsedResp = JSON.parse(response.body)
            totalPages = parsedResp['total_pages'].to_i
            parsedResp['data'].each { |user| users.push(user) }
            for page in 2..totalPages do
                rsp = conn.get('/api/users', {'page': page})
                if rsp.status == 200
                    JSON.parse(rsp.body)['data'].each { |user| users.push(user) }
                end
            end
        end
        return users
    end
end
