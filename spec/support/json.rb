# frozen_string_literal: true

def resp_data
  JSON.parse(response.body, symbolize_names: true)
end
