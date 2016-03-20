CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:      "AKIAJLNZKPMSP5CCHPAQ",                        # required
    aws_secret_access_key:  "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",                        # required
    region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'likelion-snu'                          # required
end
