desc "Delete any temporary files (Emacs *~ files, in particular)"
task :clean do
  sh 'find . -name "*~" -exec rm -v {} \;'
end

