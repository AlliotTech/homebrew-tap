set shell := ["sh", "-eu", "-c"]

default:
    just --list

update-apaste:
    ./scripts/update-apaste-cask.sh

test:
    ruby test/apaste_cask_test.rb
