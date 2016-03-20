CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:      ENV["AWS_ACCESS_KEY"],                        # required
    aws_secret_access_key:  ENV["AWS_SECRET_ACCESS_KEY"],                        # required
    region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'likelion-snu'                          # required
end
