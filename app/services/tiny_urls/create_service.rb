module TinyUrls
  class CreateService
    attr_reader :url

    def initialize(url)
      @url = url
    end

    def call
      return { errors: 'Url blank' } unless url.present?

      { short_url: Rails.application.routes.url_helpers.tiny_url_url(id: tiny_url.short_url) }
    end

    def tiny_url
      @tiny_url ||= TinyUrl.create(short_url:, url:)
    end

    def short_url
      short_url = generate_short_url until short_url_valid?(short_url)
      short_url
    end

    def short_url_valid?(short_url)
      TinyUrl.find_by(short_url:).blank? if short_url
    end

    def generate_short_url
      SecureRandom.uuid[0..5]
    end
  end
end
