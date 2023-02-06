git checkout --quiet master
git pull --quiet

git for-each-ref refs/heads/ "--format=%(refname:short)" | \
while read branch; do
  mergeBase=$(git merge-base master $branch);
  if [[ $(git cherry master $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]]; then
    echo $branch
  fi
done
