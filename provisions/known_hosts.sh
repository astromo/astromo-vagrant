# Add Github's key to known_hosts
file=~/.ssh/known_hosts

if [ ! -e "$file" ] ; then
  mkdir -p ~/.ssh
  touch "$file"
fi
ssh-keyscan -H github.com >> $file