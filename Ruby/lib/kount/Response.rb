require 'json'
module Response

  class Resp
    def initialize(paramlist)
      @paramlist = paramlist
      puts @paramlist
    end

    def getMode
      modes = @paramlist["MODE"].to_s()
      if !modes.empty?
        return modes
      end

    end

    def getVersion
      vers = @paramlist["VERS"].to_s()
      if !vers.empty?
        return vers
      end
    end

    def getTransactionId
      tran = @paramlist["TRAN"].to_s()
      if !tran.empty?
        return tran
      end
    end

    def getMerchantId
      merchantid = @paramlist["MERC"].to_s()
      if !merchantid.empty?
        return merchantid
      end
    end

    def getSessionId
      sessionid = @paramlist["SESS"].to_s()
      if !sessionid.empty?
        return sessionid
      end
    end

    def getOrderNumber
      orderno = @paramlist["ORDR"].to_s()
      if !orderno.empty?
        return orderno
      end
    end

    def getSite
      site = @paramlist["SITE"].to_s()
      if !site.empty?
        return site
      end
    end

    def getAuto
      auto = @paramlist["AUTO"].to_s()
      if !auto.empty?
        return auto
      end
    end

    def getScore
      score = @paramlist["SCOR"].to_s()
      if !score.empty?
        return score
      end
    end

    def getOmniscore
      omniscore = @paramlist['OMNISCORE'].to_s()
      if !omniscore.empty?
        return omniscore
      end
    end

    def getGeox
      geox = @paramlist["GEOX"].to_s()
      if !geox.empty?
        return geox
      end
    end

    def getBrand
      brand = @paramlist["BRND"].to_s()
      if !brand.empty?
        return brand
      end
    end

    def getVelo
      velo = @paramlist["VELO"].to_s()
      if !velo.empty?
        return velo
      end
    end

    def getVmax
      vmax = @paramlist["VMAX"].to_s()
      if !vmax.empty?
        return vmax
      end
    end

    def getNetwork
      network = @paramlist["NETW"].to_s()
      if !network.empty?
        return network
      end
    end

    def getRegion
      region = @paramlist["REGN"].to_s()
      if !region.empty?
        return region
      end
    end

    def getKaptcha
      kapt = @paramlist["KAPT"].to_s()
      if !kapt.empty?
        return kapt
      end
    end

    def getProxy
      proxy = @paramlist["PROXY"].to_s()
      if !proxy.empty?
        return proxy
      end
    end

    def getEmails
      email = @paramlist["EMAILS"].to_s()
      if !email.empty?
        return email
      end
    end

    def getHttpCountry
      httmcountry = @paramlist["HTTP_COUNTRY"].to_s()
      if !httmcountry.empty?
        return httmcountry
      end
    end

    def getTimeZone
      timezone = @paramlist["TIMEZONE"].to_s()
      if !timezone.empty?
        return timezone
      end
    end

    def getCards
      cards = @paramlist["CARDS"].to_s()
      if !cards.empty?
        return cards
      end
    end

    def getPcRemote
      pcremote = @paramlist["PC_REMOTE"].to_s()
      if !pcremote.empty?
        return pcremote
      end
    end

    def getDevices
      devices = @paramlist["DEVICES"].to_s()
      if !devices.empty?
        return devices
      end
    end

    def getDeviceLayers
      device_layers = @paramlist["DEVICE_LAYERS"].to_s()
      if !device_layers.empty?
        return device_layers
      end
    end

    def getMobileForwarder
      mobile_forwarder = @paramlist["MOBILE_FORWARDER"].to_s()
      if !mobile_forwarder.empty?
        return mobile_forwarder
      end
    end

    def getVoiceDevice
      voicedevice = @paramlist["VOICE_DEVICE"].to_s()
      if !voicedevice.empty?
        return voicedevice
      end
    end

    def getLocalTime
      localtime = @paramlist["LOCALTIME"].to_s()
      if !localtime.empty?
        return localtime
      end
    end

    def getMobileType
      mobiletype = @paramlist["MOBILE_TYPE"].to_s()
      if !mobiletype.empty?
        return mobiletype
      end
    end

    def getFingerPrint
      fingerprint = @paramlist["FINGERPRINT"].to_s()
      if !fingerprint.empty?
        return fingerprint
      end
    end

    def getFlash
      flash = @paramlist["FLASH"].to_s()
      if !flash.empty?
        return flash
      end
    end

    def getLanguage
      language = @paramlist["LANGUAGE"].to_s()
      if !language.empty?
        return language
      end
    end

    def getCountry
      country = @paramlist["COUNTRY"].to_s()
      if !country.empty?
        return country
      end
    end

    def getJavaScript
      javascript = @paramlist["JAVASCRIPT"].to_s()
      if !javascript.empty?
        return javascript
      end
    end

    def getCookies
      cookie = @paramlist["COOKIES"].to_s()
      if !cookie.empty?
        return cookie
      end
    end

    def getMobileDevice
      mobiledevice = @paramlist["MOBILE_DEVICE"].to_s()
      if !mobiledevice.empty?
        return mobiledevice
      end
    end

    def getPiercedIPAddress
      pip_address = @paramlist["PIP_IPAD"].to_s()
      if !pip_address.empty?
        return pip_address
      end
    end

    def getPiercedIPAddressLatitude
      pip_lat = @paramlist["PIP_LAT"].to_s()
      if !pip_lat.empty?
        return pip_lat
      end
    end

    def getPiercedIPAddressLongitude
      pip_long = @paramlist["PIP_LON"].to_s()
      if !pip_long.empty?
        return pip_long
      end
    end

    def getPiercedIPAddressCountry
      pip_country = @paramlist["PIP_COUNTRY"].to_s()
      if !pip_country.empty?
        return pip_country
      end
    end

    def getPiercedIPAddressRegion
      pip_region = @paramlist["PIP_REGION"].to_s()
      if !pip_region.empty?
        return pip_region
      end
    end

    def getPiercedIPAddressCity
      pip_city = @paramlist["PIP_CITY"].to_s()
      if !pip_city.empty?
        return pip_city
      end
    end

    def getPiercedIPAddressOrganization
      pip_org = @paramlist["PIP_ORG"].to_s()
      if !pip_org.empty?
        return pip_org
      end
    end

    def getIPAddress
      ip_ipad = @paramlist["IP_IPAD"].to_s()
      if !ip_ipad.empty?
        return ip_ipad
      end
    end

    def getIPAddressLatitude
      ip_lat = @paramlist["IP_LAT"].to_s()
      if !ip_lat.empty?
        return ip_lat
      end
    end

    def getIPAddressLongitude
      ip_long = @paramlist["IP_LON"].to_s()
      if !ip_long.empty?
        return ip_long
      end
    end

    def getIPAddressCountry
      ip_country = @paramlist["IP_COUNTRY"].to_s()
      if !ip_country.empty?
        return ip_country
      end
    end

    def getIPAddressRegion
      ip_region = @paramlist["IP_REGION"].to_s()
      if !ip_region.empty?
        return ip_region
      end
    end

    def getIPAddressCity
      ip_city = @paramlist["IP_CITY"].to_s()
      if !ip_city.empty?
        return ip_city
      end
    end

    def getIPAddressOrganization
      ip_org = @paramlist["IP_ORG"].to_s()
      if !ip_org.empty?
        return ip_org
      end
    end

    def getDateDeviceFirstSeen
      ddfs = @paramlist["DDFS"].to_s()
      if !ddfs.empty?
        return ddfs
      end
    end

    def getUserAgentString
      user_agent = @paramlist["UAS"].to_s()
      if !user_agent.empty?
        return user_agent
      end
    end

    def getDeviceScreenResolution
      dsr = @paramlist["DSR"].to_s()
      if !dsr.empty?
        return dsr
      end
    end

    def getOS
      os = @paramlist["OS"].to_s()
      if !os.empty?
        return os
      end
    end

    def getBrowser
      browser = @paramlist["BROWSER"].to_s()
      if !browser.empty?
        return browser
      end
    end

    def getNumberRulesTriggered
      no_rules_triggered = @paramlist["RULES_TRIGGERED"].to_s()
      return no_rules_triggered
    end

    def getRulesTriggered
      rules_count = getNumberRulesTriggered()
      rules = Array.new
      for i in 0..rules_count.to_i()-1
        ruleid = @paramlist["RULE_ID_#{i}"]
        rules[ruleid.to_i()] = @paramlist["RULE_DESCRIPTION_#{i}"]
      end
      return rules.compact

    end

    def getWarningCount
      warning_count = @paramlist["WARNING_COUNT"].to_s()
      return warning_count
    end

    def getWarnings
      warnings = Array.new
      warningcount = getWarningCount()
      for i in 0..warningcount.to_i()-1
        warnings = @paramlist["WARNING_#{i}"]
      end
      return warnings.compact
    end

    def getErrorCount
      errorcount = @paramlist["ERROR_COUNT"].to_s()
      return errorcount
    end

    def getErrors
      errors = Array.new
      error_count = getErrorCount()
      for i in 0..error_count.to_i()-1
        errors = @paramlist["ERROR_#{i}"]
      end
      return errors.compact
    end

    def getNumberCountersTriggered
      count_triggered = @paramlist["COUNTERS_TRIGGERED"].to_s()
      return count_triggered
    end

    def getCountersTriggered
      counters = Array.new
      numCounters = getCountersTriggered()
      for i in 0..counters.to_i()-1
        countername = @paramlist["COUNTER_NAME_#{i}"]
        counters[countername.to_s()] = @paramlist["COUNTER_VALUE_#{i}"]
      end
      return counters.compact
    end

  end

end