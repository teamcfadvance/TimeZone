TimeZoneDB
==========

TimeZoneDB api CFML wrapper

http://timezonedb.com/api

Parameters:
===========
* key: Required. Your unique API key you get after register your account.
* zone: Required. Zone name of an area. You can refer the name from time zone list (http://timezonedb.com/time-zones).
* lat: Required if zone not specified. Latitude of a city.
* lng: Required if zone not specified. Longitude of a city.
* tz: Optional. Unix time. Default value: Current timestamp in Unix.
* format: Optional. xml or json format for the result. Default value: xml
* cb: Optional. Use for JavaScript JSON callback.

Responses:
==========
* status: Status of the API query. Either OK or FAIL.
* message: Error message if any parameters missing or invalid. Empty if no error.
* countryCode: ISO 3166 country code (http://www.iso.org/iso/country_codes) of the country.
* zoneName: The name of the time zone. Refer to time zone list (http://timezonedb.com/time-zones).
* abbreviation: The abbreviation (http://en.wikipedia.org/wiki/List_of_time_zone_abbreviations) of time zone.
* gmtOffset: The time offset in seconds based on UTC time.
* dst: Whether Daylight Savinig Time (DST) is used. 1=Yes, 0=No
* timestamp: Current local time in Unix timestamp (http://en.wikipedia.org/wiki/Unix_timestamp).

USES: See sample .cfm and .html files for ColdFusion and JavaScript examples.