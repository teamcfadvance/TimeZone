component extends="mxunit.framework.TestCase" {

	function setUp(){
		variables.TimeZoneObj = createObject("component", "com.TimeZone").init();
	}

	function tearDown(){ }
	
	function test_ZoneXML(){
		local.result = variables.TimeZoneObj.getTimeZoneData(zone="Australia/Melbourne");
		local.parsedResult = xmlParse(trim(local.result));
		assertEquals(local.parsedResult.result.status.XmlText, "OK");
		assertEquals(local.parsedResult.result.message.XmlText, "");
		assertEquals(local.parsedResult.result.countryCode.XmlText, "AU");
		assertEquals(local.parsedResult.result.zoneName.XmlText, "Australia/Melbourne");
		assertEquals(local.parsedResult.result.abbreviation.XmlText, "EST");
		assertEquals(local.parsedResult.result.gmtOffset.XmlText, 39600);
		assertEquals(local.parsedResult.result.dst.XmlText, 1);
	}

	function test_LatLng(){
		local.result = variables.TimeZoneObj.getTimeZoneData(lat=53.7833, lng=-1.75);
		local.parsedResult = xmlParse(trim(local.result));
		assertEquals(local.parsedResult.result.status.XmlText, "OK");
		assertEquals(local.parsedResult.result.message.XmlText, "");
		assertEquals(local.parsedResult.result.countryCode.XmlText, "GB");
		assertEquals(local.parsedResult.result.zoneName.XmlText, "Europe/London");
		assertEquals(local.parsedResult.result.abbreviation.XmlText, "GMT");
		assertEquals(local.parsedResult.result.gmtOffset.XmlText, 0);
		assertEquals(local.parsedResult.result.dst.XmlText, 0);
	}

	function test_ZoneJSON(){
		local.result = variables.TimeZoneObj.getTimeZoneData(zone="America/Toronto", format="json");
		local.parsedResult = deserializeJSON(trim(local.result));
		assertEquals(local.parsedResult.status, "OK");
		assertEquals(local.parsedResult.message, "");
		assertEquals(local.parsedResult.countryCode, "CA");
		assertEquals(local.parsedResult.zoneName, "America/Toronto");
		assertEquals(local.parsedResult.abbreviation, "EST");
		assertEquals(local.parsedResult.gmtOffset, -18000);
		assertEquals(local.parsedResult.dst, 0);
	}
	
}