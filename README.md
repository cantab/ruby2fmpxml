#ruby2fmpxml

###An Example Ruby to FileMaker XML Converter

A [Sinatra](http://www.sinatrarb.com) app with example showing how to create XML with FileMaker Inc's [FMPXMLRESULT grammar](http://www.filemaker.com/help/html/import_export.16.30.html).

##About this App

Takes a URL encoded string and returns a [Rot13](http://en.wikipedia.org/wiki/ROT13) version of the string in in FMPXMLRESULT grammar.

##How to Use
Clone the app from Github
```
git clone git@github.com:cantab/ruby2fmpxml.git
```
Go into the project directory
```
cd ruby2fmpxml
```
Install gems and dependencies
```
bundle install
```
Start the Unicorn server
```
foreman start
```
The app should now be live at http://localhost:5000

##Syntax
Simply pass the string, in URL encoded form appended with a '.rot13', to the base URL.

For example, http://www.yourserver.com/string%20you%20want%20converted.rot13

##Result
The following XML shows the result of calling the app on the string "The rain in Spain stays mainly in the plain"
```xml
<FMPXMLRESULT xmlns="http://www.filemaker.com/fmpxmlresult">
  <ERRORCODE>0</ERRORCODE>
  <PRODUCT BUILD="03-21-2013" NAME="FileMaker" VERSION="ProAdvanced 12.0v4"/>
  <DATABASE DATEFORMAT="D/m/yyyy" LAYOUT="" NAME="Database.fmp12" RECORDS="1" TIMEFORMAT="h:mm:ss a"/>
  <METADATA>
  <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Input" TYPE="TEXT"/>
  <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Result" TYPE="TEXT"/>
  </METADATA>
  <RESULTSET FOUND="1">
    <ROW MODID="0" RECORDID="0">
      <COL>
        <DATA>Gur enva va Fcnva fgnlf znvayl va gur cynva</DATA>
      </COL>
    </ROW>
  </RESULTSET>
</FMPXMLRESULT>
```

##Live Web App
Explore the app live at http://ruby2fmpxml.herokuapp.com

##License
Copyright (c) 2013 Chong-Yee Khoo

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
