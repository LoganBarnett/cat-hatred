#! /usr/bin/env bash
htmlResult=`curl -H 'Accept: text/html' 'http://localhost:3000' | pup`
textResult=`curl -H 'Accept: text/plain' 'http://localhost:3000'`

htmlValid=false
textValid=false

correctHtml=$(cat <<EOF
<html>
 <head>
 </head>
 <body>
  Welcome to the official site for
  <em>
   justified
  </em>
  <strong>
   cat hatred
  </strong>
  .
 </body>
</html>

EOF
)
if [ "$htmlResult" = "$correctHtml" ]; then
    htmlValid=true
else
    echo "HTML result was '$htmlResult' but we were expecting '$correctHtml'"
fi

correctText='Welcome to the official site for justified cat hatred.'
if [ "$textResult" = "$correctText" ]; then
    textValid=true
else
    echo "Text result was '$textResult' but we were expecting '$correctText'"
fi

if [[ "$htmlValid" = true && "$textValid" = true ]]; then
    echo "The test passed and the output is what's expected\!"
else
    echo "The test failed. See error(s) above."
    exit 1
fi
