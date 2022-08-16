module Api
  module V1
    class Base < Grape::API
      include ApiDefault

      mount Api::V1::Products
    end
  end
end
