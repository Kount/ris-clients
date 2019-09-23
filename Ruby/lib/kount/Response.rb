require 'json'


module Response
  class Resp
    def initialize(paramlist)
      @paramlist = paramlist
      puts @paramlist
    end

    def get_mode
      modes = @paramlist['MODE'].to_s
      return modes unless modes.empty?
    end

    def get_version
      vers = @paramlist['VERS'].to_s
      return vers unless vers.empty?
    end

    def get_transaction_id
      tran = @paramlist['TRAN'].to_s
      return tran unless tran.empty?
    end

    def get_merchant_id
      merchantid = @paramlist['MERC'].to_s
      return merchantid unless merchantid.empty?
    end

    def get_session_id
      sessionid = @paramlist['SESS'].to_s
      return sessionid unless sessionid.empty?
    end

    def get_order_number
      orderno = @paramlist['ORDR'].to_s
      return orderno unless orderno.empty?
    end

    def get_site
      site = @paramlist['SITE'].to_s
      return site unless site.empty?
    end

    def get_auto
      auto = @paramlist['AUTO'].to_s
      return auto unless auto.empty?
    end

    def get_score
      score = @paramlist['SCOR'].to_s
      return score unless score.empty?
    end

    def get_omniscore
      omniscore = @paramlist['OMNISCORE'].to_s
      return omniscore unless omniscore.empty?
    end

    def get_geox
      geox = @paramlist['GEOX'].to_s
      return geox unless geox.empty?
    end

    def get_brand
      brand = @paramlist['BRND'].to_s
      return brand unless brand.empty?
    end

    def get_velo
      velo = @paramlist['VELO'].to_s
      return velo unless velo.empty?
    end

    def get_vmax
      vmax = @paramlist['VMAX'].to_s
      return vmax unless vmax.empty?
    end

    def get_network
      network = @paramlist['NETW'].to_s
      return network unless network.empty?
    end

    def get_region
      region = @paramlist['REGN'].to_s
      return region unless region.empty?
    end

    def get_kaptcha
      kapt = @paramlist['KAPT'].to_s
      return kapt unless kapt.empty?
    end

    def get_proxy
      proxy = @paramlist['PROXY'].to_s
      return proxy unless proxy.empty?
    end

    def get_emails
      email = @paramlist['EMAILS'].to_s
      return email unless email.empty?
    end

    def get_http_country
      httmcountry = @paramlist['HTTP_COUNTRY'].to_s
      return httmcountry unless httmcountry.empty?
    end

    def get_timezone
      timezone = @paramlist['TIMEZONE'].to_s
      return timezone unless timezone.empty?
    end

    def get_cards
      cards = @paramlist['CARDS'].to_s
      return cards unless cards.empty?
    end

    def get_pc_remote
      pcremote = @paramlist['PC_REMOTE'].to_s
      return pcremote unless pcremote.empty?
    end

    def get_devices
      devices = @paramlist['DEVICES'].to_s
      return devices unless devices.empty?
    end

    def get_device_layers
      device_layers = @paramlist['DEVICE_LAYERS'].to_s
      return device_layers unless device_layers.empty?
    end

    def get_mobile_forwarder
      mobile_forwarder = @paramlist['MOBILE_FORWARDER'].to_s
      return mobile_forwarder unless mobile_forwarder.empty?
    end

    def get_voice_device
      voicedevice = @paramlist['VOICE_DEVICE'].to_s
      return voicedevice unless voicedevice.empty?
    end

    def get_local_time
      localtime = @paramlist['LOCALTIME'].to_s
      return localtime unless localtime.empty?
    end

    def get_mobile_type
      mobiletype = @paramlist['MOBILE_TYPE'].to_s
      return mobiletype unless mobiletype.empty?
    end

    def get_fingerprint
      fingerprint = @paramlist['FINGERPRINT'].to_s
      return fingerprint unless fingerprint.empty?
    end

    def get_flash
      flash = @paramlist['FLASH'].to_s
      return flash unless flash.empty?
    end

    def get_language
      language = @paramlist['LANGUAGE'].to_s
      return language unless language.empty?
    end

    def get_country
      country = @paramlist['COUNTRY'].to_s
      return country unless country.empty?
    end

    def get_javascript
      javascript = @paramlist['JAVASCRIPT'].to_s
      return javascript unless javascript.empty?
    end

    def get_cookies
      cookie = @paramlist['COOKIES'].to_s
      return cookie unless cookie.empty?
    end

    def get_mobile_device
      mobiledevice = @paramlist['MOBILE_DEVICE'].to_s
      return mobiledevice unless mobiledevice.empty?
    end

    def get_pierced_ipaddress
      pip_address = @paramlist['PIP_IPAD'].to_s
      return pip_address unless pip_address.empty?
    end

    def get_piercedipaddress_latitude
      pip_lat = @paramlist['PIP_LAT'].to_s
      return pip_lat unless pip_lat.empty?
    end

    def get_piercedipaddress_longitude
      pip_long = @paramlist['PIP_LON'].to_s
      return pip_long unless pip_long.empty?
    end

    def get_piercedipaddress_country
      pip_country = @paramlist['PIP_COUNTRY'].to_s
      return pip_country unless pip_country.empty?
    end

    def get_piercedipaddress_region
      pip_region = @paramlist['PIP_REGION'].to_s
      return pip_region unless pip_region.empty?
    end

    def get_piercedipaddress_city
      pip_city = @paramlist['PIP_CITY'].to_s
      return pip_city unless pip_city.empty?
    end

    def get_piercedipaddress_organization
      pip_org = @paramlist['PIP_ORG'].to_s
      return pip_org unless pip_org.empty?
    end

    def get_ipaddress
      ip_ipad = @paramlist['IP_IPAD'].to_s
      return ip_ipad unless ip_ipad.empty?
    end

    def get_ipaddress_latitude
      ip_lat = @paramlist['IP_LAT'].to_s
      return ip_lat unless ip_lat.empty?
    end

    def get_ipaddress_longitude
      ip_long = @paramlist['IP_LON'].to_s
      return ip_long unless ip_long.empty?
    end

    def get_ipaddress_country
      ip_country = @paramlist['IP_COUNTRY'].to_s
      return ip_country unless ip_country.empty?
    end

    def get_ipaddress_region
      ip_region = @paramlist['IP_REGION'].to_s
      return ip_region unless ip_region.empty?
    end

    def get_ipaddress_city
      ip_city = @paramlist['IP_CITY'].to_s
      return ip_city unless ip_city.empty?
    end

    def get_ipaddress_organization
      ip_org = @paramlist['IP_ORG'].to_s
      return ip_org unless ip_org.empty?
    end

    def get_date_device_firstseen
      ddfs = @paramlist['DDFS'].to_s
      return ddfs unless ddfs.empty?
    end

    def get_useragent_string
      user_agent = @paramlist['UAS'].to_s
      return user_agent unless user_agent.empty?
    end

    def get_devicescreen_resolution
      dsr = @paramlist['DSR'].to_s
      return dsr unless dsr.empty?
    end

    def get_os
      os = @paramlist['OS'].to_s
      return os unless os.empty?
    end

    def get_browser
      browser = @paramlist['BROWSER'].to_s
      return browser unless browser.empty?
    end

    def get_numberrules_triggered
      no_rules_triggered = @paramlist['RULES_TRIGGERED'].to_s
      no_rules_triggered
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
      warning_count = @paramlist['WARNING_COUNT'].to_s
      warning_count
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
      errorcount = @paramlist['ERROR_COUNT'].to_s
      errorcount
    end

    def geterrors
      errors = []
      error_count = get_error_count
      (0..error_count.to_i - 1).each do |i|
        errors = @paramlist["ERROR_#{i}"]
      end
      errors.compact
    end

    def get_numbercounters_triggered
      count_triggered = @paramlist['COUNTERS_TRIGGERED'].to_s
      count_triggered
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
