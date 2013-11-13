<cfset variables.TimeZoneObj = createObject("component", "com.TimeZone").init()>

<cfset variables.result1 = variables.TimeZoneObj.getTimeZoneData(zone="Australia/Melbourne")>
<cfdump var="#variables.result1#">

<cfset variables.result2 = variables.TimeZoneObj.getTimeZoneData(lat=53.7833, lng=-1.75)>
<cfdump var="#variables.result2#">

<cfset variables.result3 = variables.TimeZoneObj.getTimeZoneData(zone="America/Toronto", format="json")>
<cfdump var="#variables.result3#">

<cfset variables.result4 = variables.TimeZoneObj.getTimeZoneData(zone="America/Toronto", ts="1321217345", format="json")>
<cfdump var="#variables.result4#">