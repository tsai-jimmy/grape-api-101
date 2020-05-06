module ApiV0
  class Base < Grape::API
    version 'v0', using: :path

    helpers ::ApiV0::Helpers
    helpers ::ApiV0::StrongParamsHelpers

    use ApiV0::Auth::Middleware

    include ApiV0::ExceptionHandlers

    mount Ping
    mount Posts
  end
end