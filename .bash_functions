function replace () {
  files=$1
  searchFor=$2
  replace=$3
  rg $files --files-with-matches | xargs sed -i 's/${searchFor}/${replace}/g'
  echo Done!
}
