ENV['TWITTER_KEY'] = "dbibKGWsL3mDcAD2NVlQ"
ENV['TWITTER_SECRET'] = "HFHNarEcmvfKE2ZcouxDGnMMMv5S2S45voQ6mi7jJs"
ENV['APP_ID'] = "257664194288991"
ENV['APP_SECRET'] = "9e048071f6effdb9cd016cfaa5c547ed"

Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :developer unless Rails.env.production?
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :facebook, ENV["APP_ID"], ENV["APP_SECRET"]
  provider :identity
end
