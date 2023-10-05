
Remote Update over Ethernet.
=====================================

The example flash files, in this directory, can be used to test the remote
update feature.

You can use the same script (n2c3.sh) that is used to create flash files 
destined for the SD Card to create flash files suitable for remote update.
These files are located in:
<install dir>\examples\application_selector\application_utilities\flash_file_conversion_script

NOTE:  If your design includes a processor (and software), the CPU's Reset
Address must be set to flash address offset 0x0.

Instructions:
=============
1. Power on your board.
2. Connect your ethernet cable to a network that provides DHCP (preferably
   via a switch/hub).
   - The acquired IP Address will be displayed in the lower right-hand corner.
3. Type the acquired IP Address in your web browser.
4. In the web page that comes up, you'll see browse buttons for HW and SW
   images (files).
   - Using the "CFI Flash File Upload" form, browse to your hardware flash file
     and select it.
   - (Optionally) browse to your software flash file and select it.
5. Click Upload.
   - The flash files will be uploaded and programmed into flash.
   - Upon completion, a page containing a "Reset System" button will be
     presented.
6. Click the "Reset System" button.
   - After a few seconds, the system will reset to your design.

NOTE:  The example web server, and content, contain useful examples of how to
map both POST and GET requests to dynamically created content.  Specifically, 
two custom POST requests are used to enable flash file uploading and system reset, 
and one custom GET request is used to send Javascript Object Notation (JSON) 
object back to the progress bar web content element.
