#!/bin/bash
# rebase all branches to master

for branch in $(ls -1 .git/refs/heads); do
  # do not operate on master, generic
  test ${branch} = master && continue
  test ${branch} = generic && continue

  # checkout branch and rebase to generic
  git checkout ${branch}
  git rebase generic
done

git checkout master
