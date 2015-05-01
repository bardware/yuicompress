I use `createDynamicProxy` to instantiate a class implementing an interface defined in a 3rd party jar file.
I want to pass the class to the constructor of another class.

It works quite well when the jar file resides in a subdirectory which is specified in the `THIS.javaSettings` `LoadPaths` member.
It does not work if `THIS.javaSettings` does not exist, even if the jar file is stored in the classpath set in the Coldfusion administrator.
