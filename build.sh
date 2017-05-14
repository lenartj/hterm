#!/bin/bash

set -e

cd $(dirname -- "$0")
upstream/hterm/bin/mkdist.sh

{
  cat <<HEADER
(function(exports) {
HEADER
  cat upstream/hterm/dist/js/hterm_all.js
  cat <<FOOTER
exports.lib = lib;
exports.hterm = hterm;
})(window);
FOOTER
} >js/hterm.js
