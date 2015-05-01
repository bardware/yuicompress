<cfcomponent>

<!---
	<cffunction name="init" access="public" output="false" returntype="cfc.ErrorReporter">

		<cfreturn this>
	</cffunction>
 --->

	<cffunction name="warning" returntype="void">
		<cfargument name="message" type="java.lang.String" required="false">
		<cfargument name="sourceName" type="java.lang.String" required="false">
		<cfargument name="line" type="int" required="false">
		<cfargument name="lineSource" type="java.lang.String" required="false">
		<cfargument name="lineOffset" type="int" required="false">

	</cffunction>

	<cffunction name="error" returntype="void">
		<cfargument name="message" type="java.lang.String" required="false">
		<cfargument name="sourceName" type="java.lang.String" required="false">
		<cfargument name="line" type="int" required="false">
		<cfargument name="lineSource" type="java.lang.String" required="false">
		<cfargument name="lineOffset" type="int" required="false">

	</cffunction>

	<cffunction name="runtimeError" returntype="org.mozilla.javascript.EvaluatorException">
		<cfargument name="message" type="java.lang.String" required="false">
		<cfargument name="sourceName" type="java.lang.String" required="false">
		<cfargument name="line" type="int" required="false">
		<cfargument name="lineSource" type="java.lang.String" required="false">
		<cfargument name="lineOffset" type="int" required="false">

		<cfset local.exc = createobject( "java", "org.mozilla.javascript.EvaluatorException" ).init( arguments.message )>

		<cfreturn local.ex>
	</cffunction>

</cfcomponent>

<!---
                 public void warning(String message, String sourceName, int line, String lineSource, int lineOffset)
                  {
                    System.err.println("\n[WARNING] in " + this.val$localFilename);
                    if (line < 0) {
                      System.err.println("  " + message);
                    } else {
                      System.err.println("  " + line + ':' + lineOffset + ':' + message);
                    }
                  }

                  public void error(String message, String sourceName, int line, String lineSource, int lineOffset)
                  {
                    System.err.println("[ERROR] in " + this.val$localFilename);
                    if (line < 0) {
                      System.err.println("  " + message);
                    } else {
                      System.err.println("  " + line + ':' + lineOffset + ':' + message);
                    }
                  }

                  public EvaluatorException runtimeError(String message, String sourceName, int line, String lineSource, int lineOffset)
                  {
                    error(message, sourceName, line, lineSource, lineOffset);
                    return new EvaluatorException(message);
                  }

 --->