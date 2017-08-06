Frequently Asked Questions

1. During set-up my makefile is not being created. Citing nokogiri error.
	
	The error occurs with accessing the Makefile for the nokogiri gem. This occurs when initially installing the UWNerdist bundle. To explain it more clearly here is an explination from Stack overflow;

	For some reason Apple’s Yosemite version of OSX does not have a system accessible installation of libxml2. Nokogiri requires this in order to compile and luckily Xcode has a version of libxml2 bundled with it — we just need to specify it when installing the gem. It’s important to get Nokogiri installed correctly because as of right now Rails 4.2.1.rc4 automatically attempts to install it and you will feel pain.

	So the fix just gives a work around to install nokogiri using the Xcode. Type the following into terminal.

	gem uninstall #
 	xcode-select --install
 	gem install #

	An alternative fix is to use the command :

	gem install nokogiri -- --use-system-libraries=true --with-xml2-include=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/include/libxml2/