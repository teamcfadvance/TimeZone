<cfscript>
	testSuite = createObject("component","mxunit.framework.TestSuite").TestSuite();
	testSuite.addAll("tests.TimeZoneTest");
	results = testSuite.run();
	writeOutput(results.getResultsOutput('html'));
</cfscript>