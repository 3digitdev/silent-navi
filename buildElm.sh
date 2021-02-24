#!/bin/bash

# Standard building

# Compile Elm
elm make src/Main.elm --optimize --output=public/navi.js

# Debug Commands
# elm make src/Main.elm --output=public/navi.js
# elm reactor
