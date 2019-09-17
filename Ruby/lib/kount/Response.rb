require 'json'


module Response
  class Resp
    def initialize(paramlist)
      @paramlist = paramlist
      puts @paramlist
    end

    def getMode
      modes = @paramlist['MODE'].to_s
      return modes unless modes.empty?
    end

    def getVersion
      vers = @paramlist['VERS'].to_s
      return vers unless vers.empty?
    end

    def getTransactionId
      tran = @paramlist['TRAN'].to_s
      return tran unless tran.empty?
    end

    def getMerchantId
      merchantid = @paramlist['MERC'].to_s
      return merchantid unless merchantid.empty?
    end

    def getSessionId
      sessionid = @paramlist['SESS'].to_s
      return sessionid unless sessionid.empty?
    end

    def getOrderNumber
      orderno = @paramlist['ORDR'].to_s
      return orderno unless orderno.empty?
    end

    def getSite
      site = @paramlist['SITE'].to_s
      return site unless site.empty?
    end

    def getAuto
      auto = @paramlist['AUTO'].to_s
      return auto unless auto.empty?
    end

    def getScore
      score = @paramlist['SCOR'].to_s
      return score unless score.empty?
    end

    def getOmniscore
      omniscore = @paramlist['OMNISCORE'].to_s
      return omniscore unless omniscore.empty?
    end

    def getGeox
      geox = @paramlist['GEOX'].to_s
      return geox unless geox.empty?
    end

    def getBrand
      brand = @paramlist['BRND'].to_s
      return brand unless brand.empty?
    end

    def getVelo
      velo = @paramlist['VELO'].to_s
      return velo unless velo.empty?
    end

    def getVmax
      vmax = @paramlist['VMAX'].to_s
      return vmax unless vmax.empty?
    end

    def getNetwork
      network = @paramlist['NETW'].to_s
      return network unless network.empty?
    end

    def getRegion
      region = @paramlist['REGN'].to_s
      return region unless region.empty?
    end

    def getKaptcha
      kapt = @paramlist['KAPT'].to_s
      return kapt unless kapt.empty?
    end

    def getProxy
      proxy = @paramlist['PROXY'].to_s
      return proxy unless proxy.empty?
    end

    def getEmails
      email = @paramlist['EMAILS'].to_s
      return email unless email.empty?
    end

    def getHttpCountry
      httmcountry = @paramlist['HTTP_COUNTRY'].to_s
      return httmcountry unless httmcountry.empty?
    end

    def getTimeZone
      timezone = @paramlist['TIMEZONE'].to_s
      return timezone unless timezone.empty?
    end

    def getCards
      cards = @paramlist['CARDS'].to_s
      return cards unless cards.empty?
    end

    def getPcRemote
      pcremote = @paramlist['PC_REMOTE'].to_s
      return pcremote unless pcremote.empty?
    end

    def getDevices
      devices = @paramlist['DEVICES'].to_s
      return devices unless devices.empty?
    end

    def getDeviceLayers
      device_layers = @paramlist['DEVICE_LAYERS'].to_s
      return device_layers unless device_layers.empty?
    end

    def getMobileForwarder
      mobile_forwarder = @paramlist['MOBILE_FORWARDER'].to_s
      return mobile_forwarder unless mobile_forwarder.empty?
    end

    def getVoiceDevice
      voicedevice = @paramlist['VOICE_DEVICE'].to_s
      return voicedevice unless voicedevice.empty?
    end

    def getLocalTime
      localtime = @paramlist['LOCALTIME'].to_s
      return localtime unless localtime.empty?
    end

    def getMobileType
      mobiletype = @paramlist['MOBILE_TYPE'].to_s
      return mobiletype unless mobiletype.empty?
    end

    def getFingerPrint
      fingerprint = @paramlist['FINGERPRINT'].to_s
      return fingerprint unless fingerprint.empty?
    end

    def getFlash
      flash = @paramlist['FLASH'].to_s
      return flash unless flash.empty?
    end

    def getLanguage
      language = @paramlist['LANGUAGE'].to_s
      return language unless language.empty?
    end

    def getCountry
      country = @paramlist['COUNTRY'].to_s
      return country unless country.empty?
    end

    def getJavaScript
      javascript = @paramlist['JAVASCRIPT'].to_s
      return javascript unless javascript.empty?
    end

    def getCookies
      cookie = @paramlist['COOKIES'].to_s
      return cookie unless cookie.empty?
    end

    def getMobileDevice
      mobiledevice = @paramlist['MOBILE_DEVICE'].to_s
      return mobiledevice unless mobiledevice.empty?
    end

    def getPiercedIPAddress
      pip_address = @paramlist['PIP_IPAD'].to_s
      return pip_address unless pip_address.empty?
    end

    def getPiercedIPAddressLatitude
      pip_lat = @paramlist['PIP_LAT'].to_s
      return pip_lat unless pip_lat.empty?
    end

    def getPiercedIPAddressLongitude
      pip_long = @paramlist['PIP_LON'].to_s
      return pip_long unless pip_long.empty?
    end

    def getPiercedIPAddressCountry
      pip_country = @paramlist['PIP_COUNTRY'].to_s
      return pip_country unless pip_country.empty?
    end

    def getPiercedIPAddressRegion
      pip_region = @paramlist['PIP_REGION'].to_s
      return pip_region unless pip_region.empty?
    end

    def getPiercedIPAddressCity
      pip_city = @paramlist['PIP_CITY'].to_s
      return pip_city unless pip_city.empty?
    end

    def getPiercedIPAddressOrganization
      pip_org = @paramlist['PIP_ORG'].to_s
      return pip_org unless pip_org.empty?
    end

    def getIPAddress
      ip_ipad = @paramlist['IP_IPAD'].to_s
      return ip_ipad unless ip_ipad.empty?
    end

    def getIPAddressLatitude
      ip_lat = @paramlist['IP_LAT'].to_s
      return ip_lat unless ip_lat.empty?
    end

    def getIPAddressLongitude
      ip_long = @paramlist['IP_LON'].to_s
      return ip_long unless ip_long.empty?
    end

    def getIPAddressCountry
      ip_country = @paramlist['IP_COUNTRY'].to_s
      return ip_country unless ip_country.empty?
    end

    def getIPAddressRegion
      ip_region = @paramlist['IP_REGION'].to_s
      return ip_region unless ip_region.empty?
    end

    def getIPAddressCity
      ip_city = @paramlist['IP_CITY'].to_s
      return ip_city unless ip_city.empty?
    end

    def getIPAddressOrganization
      ip_org = @paramlist['IP_ORG'].to_s
      return ip_org unless ip_org.empty?
    end

    def getDateDeviceFirstSeen
      ddfs = @paramlist['DDFS'].to_s
      return ddfs unless ddfs.empty?
    end

    def getUserAgentString
      user_agent = @paramlist['UAS'].to_s
      return user_agent unless user_agent.empty?
    end

    def getDeviceScreenResolution
      dsr = @paramlist['DSR'].to_s
      return dsr unless dsr.empty?
    end

    def getOS
      os = @paramlist['OS'].to_s
      return os unless os.empty?
    end

    def getBrowser
      browser = @paramlist['BROWSER'].to_s
      return browser unless browser.empty?
    end

    def getNumberRulesTriggered
      no_rules_triggered = @paramlist['RULES_TRIGGERED'].to_s
      no_rules_triggered
    end

    def getRulesTriggered
      rules_count = getNumberRulesTriggered
      rules = []
      (0..rules_count.to_i - 1).each do |i|
        ruleid = @paramlist["RULE_ID_#{i}"]
        rules[ruleid.to_i] = @paramlist["RULE_DESCRIPTION_#{i}"]
      end
      rules.compact
    end

    def getWarningCount
      warning_count = @paramlist['WARNING_COUNT'].to_s
      warning_count
    end

    def getWarnings
      warnings = []
      warningcount = getWarningCount
      (0..warningcount.to_i - 1).each do |i|
        warnings = @paramlist["WARNING_#{i}"]
      end
      warnings.compact
    end

    def getErrorCount
      errorcount = @paramlist['ERROR_COUNT'].to_s
      errorcount
    end

    def getErrors
      errors = []
      error_count = getErrorCount
      (0..error_count.to_i - 1).each do |i|
        errors = @paramlist["ERROR_#{i}"]
      end
      errors.compact
    end

    def getNumberCountersTriggered
      count_triggered = @paramlist['COUNTERS_TRIGGERED'].to_s
      count_triggered
    end

    def getCountersTriggered
      counters = []
      numCounters = getCountersTriggered
      (0..counters.to_i - 1).each do |i|
        countername = @paramlist["COUNTER_NAME_#{i}"]
        counters[countername.to_s] = @paramlist["COUNTER_VALUE_#{i}"]
      end
      counters.compact
    end
  end
end
