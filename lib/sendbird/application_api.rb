module Sendbird
  class ApplicationApi
    extend Client
    ENDPOINT = 'applications'.freeze

    class << self
      def create(body)
        post_http_basic(path: build_url, body: body)
      end

      def list(params={})
        get_http_basic(path: build_url, params: params)
      end

      # Right now this endpoint is failing in there site
      def view
        get(path: build_url('info'))
      end

      def destroy_all
        delete_http_basic(path: build_url)
      end

      def destroy
        delete(path: build_url)
      end

      def profanaty(body={})
        put(path: build_url('profanity'), body: body)
      end

      def ccu
        get(path: build_url('ccu'))
      end

      def mau(params={})
        get(path: build_url('mau'), params: params)
      end

      def dau(params={})
        get(path: build_url('dau'), params: params)
      end

      def daily_message_count(params={})
        get(path: build_url('daily_count'), params: params)
      end

      def gcm_push_configuration
        get(path: build_url('push', 'gcm'))
      end
      
      def add_gcm_push_configuration(body={})
        post(path: build_url('push', 'gcm'), body: body)
      end
      
      def destroy_gcm_push_configuration(gcm_id)
        delete(path: build_url('push', 'gcm', gcm_id))
      end

      def apns_push_configuration
        get(path: build_url('push', 'apns'))
      end
      
      def add_apns_push_configuration(body={})
        post_with_file(path: build_url('push', 'apns'), body: body)
      end
      
      def destroy_apns_push_configuration(apns_id)
        delete(path: build_url('push', 'apns', apns_id))
      end
      
      def settings_global(params={})
        get(path: build_url('settings_global'), params: params)
      end
      
      def update_settings_global(body={})
        put(path: build_url('settings_global'), body: body)
      end
    end
  end
end
