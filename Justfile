set shell := ["sh", "-eu", "-c"]

default:
    just --list

update-alt-tab:
    ./scripts/update-alt-tab-cask.sh

update-apaste:
    ./scripts/update-apaste-cask.sh

update-uutmux:
    ./scripts/update-uutmux-cask.sh

test:
    ruby test/apaste_cask_test.rb
    ruby test/alt_tab_no_pro_cask_test.rb
    ruby test/uutmux_cask_test.rb
