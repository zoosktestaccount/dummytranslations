#! /bin/bash
THIS_GIT_HASH=`git rev-parse HEAD`
THIS_GIT_BRANCH=`git rev-parse --abbrev-ref HEAD`
node_modules/.bin/ng xi18n
git add src/messages.xlf
node_modules/.bin/xliffmerge -p xliffmerge.json
git add src/locale/*.xlf
git commit -m "Extracted strings from ${THIS_GIT_BRANCH} as ${THIS_GIT_HASH}"
git push
