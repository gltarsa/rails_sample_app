task :clean do
  sh 'find . -name "*~" -exec rm -v {} \;'
end

