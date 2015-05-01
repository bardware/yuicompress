<cfset stReturn = structNew()>

<!--- Create Object of ErrorReporter --->
<cfset oErrRep = createObject("cfc.ErrorReporter")>
<!---
<cfdump var="#oErrRep#">
 --->

<!--- Create Dynamic proxy instance  --->
<cfset jErrRep = createDynamicProxy(oErrRep, ["org.mozilla.javascript.ErrorReporter"])>
<cfdump var="#jErrRep#">

<cffile action="read" variable="inputString" file="#GetDirectoryFromPath( getCurrentTemplatePath() )#examples/jquery-1.8.2.js">
<!---
<cfdump var="#inputString#">
 --->

<cfset joInput = createObject("java","java.io.StringReader").init(inputString)>
<!---
<cfdump var="#joInput#">
 --->

<cfset joOutput = createObject('java','java.io.StringWriter').init() />
<!---
<cfdump var="#joOutput#">
 --->

<cfset compr = createobject( "java", "com.yahoo.platform.yui.compressor.JavaScriptCompressor" ).init( joInput, jErrRep )>
<!---
<cfdump var="#compr#">
 --->

<!---
<cfset compr.compress(joOutput
	, javaCast('int',arguments.linebreak)
	, javaCast('boolean',arguments.munge)
	, javaCast('boolean',arguments.verbose)
	, javaCast('boolean',arguments.preserveAllSemiColons)
	, javaCast('boolean',arguments.disableOptimizations)
>
 --->
<cfset compr.compress(joOutput
		, javaCast( 'int', -1 )
		, javaCast( 'boolean', false )
		, javaCast( 'boolean', false )
		, javaCast( 'boolean', false )
		, javaCast( 'boolean', false )
)>

<cfset stReturn.results = joOutput.toString() />
<cfset joOutput.close() />
<cfset joInput.close() />

<cfset stReturn.uncompressed = len(inputString) />
<cfset stReturn.compressed = len(stReturn.results) />
<cfset stReturn.compression = (1 - (stReturn.compressed / stReturn.uncompressed)) * 100 />

<cfdump var="#stReturn#">
