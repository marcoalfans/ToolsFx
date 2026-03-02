#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

FX_PATH="/usr/share/openjfx/lib"
EXTRA_JAVA_OPTS="--module-path ${FX_PATH} \
--add-modules javafx.controls,javafx.fxml,javafx.graphics,javafx.web,javafx.media,javafx.swing \
--add-exports javafx.graphics/com.sun.glass.ui=ALL-UNNAMED \
--add-opens javafx.graphics/com.sun.glass.ui=ALL-UNNAMED \
-Duser.language=id -Duser.country=ID"

FX="${FX_PATH}" JAVA_OPTS="${EXTRA_JAVA_OPTS} ${JAVA_OPTS:-}" ./ToolsFx
