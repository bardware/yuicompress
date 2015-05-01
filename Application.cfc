<cfcomponent>
	<cfset this.name = "yuicompress">

	<cfset THIS.javaSettings = {
			LoadPaths = ["/lib"]
			, loadColdFusionClassPath = true
			, reloadOnChange= true
			, watchInterval = 10
	}>

</cfcomponent>