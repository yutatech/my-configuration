#!/bin/sh
# tmux configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
source $SCRIPT_DIR/../setup_utils/utils.sh

SOURCE_FILES=""

CHECK_FILES=""

SYMLINKS="
    $HOME/.tmux.conf
"

if [ -n "${BASH_VERSION}" ]; then
    # bashの場合
    SOURCE_FILES="
        $SOURCE_FILES
        $SCRIPT_DIR/completion/tmux.completion.bash
    "
fi

COMMANDS="tmux"

is_configure_completed "$SOURCE_FILES $CHECK_FILES" "$SYMLINKS" "$COMMANDS"
CONFIG_COMPETED=$?

source $SCRIPT_DIR/source/tpm_utils.sh
is_tpm_setup
CONFIG_COMPLETED=$(( CONFIG_COMPLETED && $? ))

if [ $CONFIG_COMPETED -eq 1 ]; then
    # 設定が完了していない場合は、コマンドを上書き
    source $SCRIPT_DIR/source/overwrite_command.sh
else
    source_all "$SOURCE_FILES"
fi

source $SCRIPT_DIR/../setup_utils/unset_utils.sh