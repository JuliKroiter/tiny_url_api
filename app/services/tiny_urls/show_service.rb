module TinyUrls
  class ShowService
    attr_reader :url

    def initialize(tiny_url)
      @tiny_url = tiny_url
    end

    def call
      update_clicked

      { url: @tiny_url.url }
    end

    private

    def update_clicked
      @tiny_url.update(clicked:)
    end

    def clicked
      @tiny_url.clicked + 1
    end
  end
end
