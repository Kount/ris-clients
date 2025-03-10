require 'json'


module Response
  class Resp
    def initialize(paramlist)
      @paramlist = paramlist
      puts @paramlist
    end

    def get_mode
      modes = @paramlist['MODE'].to_s
      modes unless modes.empty?
    end

    def get_version
      vers = @paramlist['VERS'].to_s
      vers unless vers.empty?
    end

    def get_transaction_id
      tran = @paramlist['TRAN'].to_s
      tran unless tran.empty?
    end

    def get_merchant_id
      merchantid = @paramlist['MERC'].to_s
      merchantid unless merchantid.empty?
    end

    def get_session_id
      sessionid = @paramlist['SESS'].to_s
      sessionid unless sessionid.empty?
    end

    def get_order_number
      orderno = @paramlist['ORDR'].to_s
      orderno unless orderno.empty?
    end

    def get_site
      site = @paramlist['SITE'].to_s
      site unless site.empty?
    end

    def get_auto
      auto = @paramlist['AUTO'].to_s
      auto unless auto.empty?
    end

    def get_score
      score = @paramlist['SCOR'].to_s
      score unless score.empty?
    end

    def get_omniscore
      omniscore = @paramlist['OMNISCORE'].to_s
      omniscore unless omniscore.empty?
    end

    def get_geox
      geox = @paramlist['GEOX'].to_s
      geox unless geox.empty?
    end

    def get_brand
      brand = @paramlist['BRND'].to_s
      brand unless brand.empty?
    end

    def get_velo
      velo = @paramlist['VELO'].to_s
      velo unless velo.empty?
    end

    def get_vmax
      vmax = @paramlist['VMAX'].to_s
      vmax unless vmax.empty?
    end

    def get_network
      network = @paramlist['NETW'].to_s
      network unless network.empty?
    end

    def get_region
      region = @paramlist['REGN'].to_s
      region unless region.empty?
    end

    def get_kaptcha
      kapt = @paramlist['KAPT'].to_s
      kapt unless kapt.empty?
    end

    def get_proxy
      proxy = @paramlist['PROXY'].to_s
      proxy unless proxy.empty?
    end

    def get_emails
      email = @paramlist['EMAILS'].to_s
      email unless email.empty?
    end

    def get_http_country
      httmcountry = @paramlist['HTTP_COUNTRY'].to_s
      httmcountry unless httmcountry.empty?
    end

    def get_timezone
      timezone = @paramlist['TIMEZONE'].to_s
      timezone unless timezone.empty?
    end

    def get_cards
      cards = @paramlist['CARDS'].to_s
      cards unless cards.empty?
    end

    def get_pc_remote
      pcremote = @paramlist['PC_REMOTE'].to_s
      pcremote unless pcremote.empty?
    end

    def get_devices
      devices = @paramlist['DEVICES'].to_s
      devices unless devices.empty?
    end

    def get_device_layers
      device_layers = @paramlist['DEVICE_LAYERS'].to_s
      device_layers unless device_layers.empty?
    end

    def get_mobile_forwarder
      mobile_forwarder = @paramlist['MOBILE_FORWARDER'].to_s
      mobile_forwarder unless mobile_forwarder.empty?
    end

    def get_voice_device
      voicedevice = @paramlist['VOICE_DEVICE'].to_s
      voicedevice unless voicedevice.empty?
    end

    def get_local_time
      localtime = @paramlist['LOCALTIME'].to_s
      localtime unless localtime.empty?
    end

    def get_mobile_type
      mobiletype = @paramlist['MOBILE_TYPE'].to_s
      mobiletype unless mobiletype.empty?
    end

    def get_fingerprint
      fingerprint = @paramlist['FINGERPRINT'].to_s
      fingerprint unless fingerprint.empty?
    end

    def get_flash
      flash = @paramlist['FLASH'].to_s
      flash unless flash.empty?
    end

    def get_language
      language = @paramlist['LANGUAGE'].to_s
      language unless language.empty?
    end

    def get_country
      country = @paramlist['COUNTRY'].to_s
      country unless country.empty?
    end

    def get_javascript
      javascript = @paramlist['JAVASCRIPT'].to_s
      javascript unless javascript.empty?
    end

    def get_cookies
      cookie = @paramlist['COOKIES'].to_s
      cookie unless cookie.empty?
    end

    def get_mobile_device
      mobiledevice = @paramlist['MOBILE_DEVICE'].to_s
      mobiledevice unless mobiledevice.empty?
    end

    def get_pierced_ipaddress
      pip_address = @paramlist['PIP_IPAD'].to_s
      pip_address unless pip_address.empty?
    end

    def get_piercedipaddress_latitude
      pip_lat = @paramlist['PIP_LAT'].to_s
      pip_lat unless pip_lat.empty?
    end

    def get_piercedipaddress_longitude
      pip_long = @paramlist['PIP_LON'].to_s
      pip_long unless pip_long.empty?
    end

    def get_piercedipaddress_country
      pip_country = @paramlist['PIP_COUNTRY'].to_s
      pip_country unless pip_country.empty?
    end

    def get_piercedipaddress_region
      pip_region = @paramlist['PIP_REGION'].to_s
      pip_region unless pip_region.empty?
    end

    def get_piercedipaddress_city
      pip_city = @paramlist['PIP_CITY'].to_s
      pip_city unless pip_city.empty?
    end

    def get_piercedipaddress_organization
      pip_org = @paramlist['PIP_ORG'].to_s
      pip_org unless pip_org.empty?
    end

    def get_ipaddress
      ip_ipad = @paramlist['IP_IPAD'].to_s
      ip_ipad unless ip_ipad.empty?
    end

    def get_ipaddress_latitude
      ip_lat = @paramlist['IP_LAT'].to_s
      ip_lat unless ip_lat.empty?
    end

    def get_previous_whitelisted
      whitelisted = @paramlist['PREVIOUSLY_WHITELISTED'].to_s
      whitelisted unless whitelisted.empty?
    end

    def get_secure_merchant_response
      merchant_response = @paramlist['THREE_DS_MERCHANT_RESPONSE'].to_s
      merchant_response unless merchant_response.empty?
    end

    def get_ipaddress_longitude
      ip_long = @paramlist['IP_LON'].to_s
      ip_long unless ip_long.empty?
    end

    def get_ipaddress_country
      ip_country = @paramlist['IP_COUNTRY'].to_s
      ip_country unless ip_country.empty?
    end

    def get_ipaddress_region
      ip_region = @paramlist['IP_REGION'].to_s
      ip_region unless ip_region.empty?
    end

    def get_ipaddress_city
      ip_city = @paramlist['IP_CITY'].to_s
      ip_city unless ip_city.empty?
    end

    def get_ipaddress_organization
      ip_org = @paramlist['IP_ORG'].to_s
      ip_org unless ip_org.empty?
    end

    def get_date_device_firstseen
      ddfs = @paramlist['DDFS'].to_s
      ddfs unless ddfs.empty?
    end

    def get_useragent_string
      user_agent = @paramlist['UAS'].to_s
      user_agent unless user_agent.empty?
    end

    def get_devicescreen_resolution
      dsr = @paramlist['DSR'].to_s
      dsr unless dsr.empty?
    end

    def get_os
      os = @paramlist['OS'].to_s
      os unless os.empty?
    end

    def get_browser
      browser = @paramlist['BROWSER'].to_s
      browser unless browser.empty?
    end

    def get_numberrules_triggered
      # changed due to rubocop styling rules for ruby
      @paramlist['RULES_TRIGGERED'].to_s
    end

    def get_rules_triggered
      rules_count = get_numberrules_triggered
      rules = []
      (0..rules_count.to_i - 1).each do |i|
        ruleid = @paramlist["RULE_ID_#{i}"]
        rules[ruleid.to_i] = @paramlist["RULE_DESCRIPTION_#{i}"]
      end
      rules.compact
    end

    def get_warning_count
      # changed due to rubocop styling rules for ruby
      @paramlist['WARNING_COUNT'].to_s
    end

    def get_warnings
      warnings = []
      warningcount = get_warning_count
      (0..warningcount.to_i - 1).each do |i|
        warnings = @paramlist["WARNING_#{i}"]
      end
      warnings.compact
    end

    def get_error_count
      # changed due to rubocop styling rules for ruby
      @paramlist['ERROR_COUNT'].to_s
    end

    def get_errors
      errors = []
      error_count = get_error_count.to_i
      (0..error_count - 1).each do |i|
        errors << @paramlist["ERROR_#{i}"]
      end
      errors.compact
    end
    alias geterrors get_errors

    def get_numbercounters_triggered
      # changed due to rubocop styling rules for ruby
      @paramlist['COUNTERS_TRIGGERED'].to_s
    end

    def get_counters_triggered
      counters = []
      numCounters = get_numbercounters_triggered
      (0..numCounters.to_i - 1).each do |i|
        countername = @paramlist["COUNTER_NAME_#{i}"]
        counters[countername.to_s] = @paramlist["COUNTER_VALUE_#{i}"]
      end
      counters.compact
    end
  end
end
