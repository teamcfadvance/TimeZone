<cfcomponent displayname="Time Zone Object" output="false" hint="I am the Time Zone component.">

	<cfset variables.baseURI = "http://api.timezonedb.com/">
	<cfset variables.apiKey = "">

	<cffunction name="init" access="public" output="false" hint="I initialize the component.">

		<cfreturn this>
	</cffunction>

	<cffunction name="getTimeZoneData" access="public" returntype="any" output="false" hint="I return time zone data.">
		<cfargument name="zone" type="string" required="false" hint="Zone name of an area.">
		<cfargument name="lat" type="numeric" required="false" hint="Latitude of a city.">
		<cfargument name="lng" type="numeric" required="false" hint="Longitude of a city.">
		<cfargument name="ts" type="numeric" required="false" hint="Current timestamp in Unix.">
		<cfargument name="format" type="string" required="false" default="xml" hint="Format for the result (xml or json).">
		<cfargument name="cb" type="string" required="false" hint="Use for JavaScript JSON callback.">

		<cfscript>
			var local = structNew();

			local.querystring = "key=#variables.apiKey#";

			// validation rules
			if ( NOT structKeyExists(arguments, "zone") AND NOT structKeyExists(arguments, "lat") AND NOT structKeyExists(arguments, "lng") ) {
				throw(type="validation", message="Invalid arguments.", detail="If 'zone' is not provided, then 'lat' and 'lng' are both required.");
			}

			if ( structKeyExists(arguments, "zone") ) {
				local.querystring &= "&zone=#arguments.zone#";
			}

			if ( structKeyExists(arguments, "lat") ) {
				local.querystring &= "&lat=#arguments.lat#";
			}

			if ( structKeyExists(arguments, "lng") ) {
				local.querystring &= "&lng=#arguments.lng#";
			}

			if ( structKeyExists(arguments, "ts") ) {
				local.querystring &= "&time=#arguments.ts#";
			}

			if ( structKeyExists(arguments, "format") ) {
				local.querystring &= "&format=#arguments.format#";
			}

			if ( structKeyExists(arguments, "cb") ) {
				local.querystring &= "&callback=#arguments.cb#";
			}

			local.fullURI = "#variables.baseURI#?#local.querystring#";

			local.httpResponse = makeHttpCall(fullURI=local.fullURI);

			return local.httpResponse.Filecontent;
		</cfscript>
	</cffunction>

	<cffunction name="getTimeZoneDataRemote" access="remote" returntype="any" returnformat="plain" output="false" hint="I return time zone data.">
		<cfargument name="zone" type="string" required="false" hint="Zone name of an area.">
		<cfargument name="lat" type="numeric" required="false" hint="Latitude of a city.">
		<cfargument name="lng" type="numeric" required="false" hint="Longitude of a city.">
		<cfargument name="ts" type="date" required="false" hint="Current timestamp in Unix.">
		<cfargument name="format" type="string" required="false" hint="Format for the result.">
		<cfargument name="cb" type="string" required="false" hint="Use for JavaScript JSON callback.">

		<cfreturn getTimeZoneData(argumentCollection=arguments)>
	</cffunction>

	<cffunction name="makeHttpCall" access="private" output="false" returntype="any" hint="I call the API via CFHTTP.">
		<cfargument name="fullURI" required="true" type="string" hint="I am the full URI to call into the API.">
		<cfargument name="httpMethod" required="false" type="string" default="GET" hint="I am either POST or GET.">

		<cfhttp url="#arguments.fullURI#" method="#arguments.httpMethod#" resolveurl="false" />

		<cfreturn cfhttp>
	</cffunction>

	<cffunction name="onMissingMethod" hint="I catch a missing method.">
		<cfargument name="missingMethodName" type="string">
	    <cfargument name="missingMethodArguments" type="struct">

	</cffunction>

</cfcomponent>