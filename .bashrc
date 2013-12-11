#default_directory='terrible_twos'
#default_directory='be_two_or_not_be_two'
#default_directory='cable_calc'
default_directory='antcat'
alias home="cd ~/$default_directory"

# editing this file
alias p='vim ~/.bashrc'
alias s='source ~/.bash_profile'

# default arguments and shortcuts
alias grep='grep -E -s -H --color'

# -G colorized output
alias ls='ls  -G'

# -A include .files (except . & ..)
# -h unit suffixes
# -o long format, no group id
alias ll='ls  -AGhlno'
# -t sort by time
alias llt='ls -AGhlnot'
# -S sort by size
alias lls='ls -AGhlnoS'

# substitute program
alias vim=mvim

# Rails
alias remigrate='bundle exec rake db:migrate:redo && bundle exec rake db:test:prepare'
alias prep='bundle exec rake db:test:prepare'
alias db="rails dbconsole"
alias sc="rails console"
alias ss="rails server"
alias migrate='bundle exec rake db:migrate && bundle exec rake db:test:prepare'
alias devlog='tail -f -n1000 log/development.log'
alias testlog='tail -f -n1000 log/test.log'
alias sp='bundle exec rspec'
alias cuc='bundle exec cucumber'
alias rake='bundle exec rake --trace'
alias spk='bundle exec spork'
alias spkc='bundle exec spork cucumber'
# to find long-running requests
# grep [0-9][0-9][0-9][0-9][0-9]ms production.log -A5 -B20

# changing directories
alias cdv='cd ~/.vim'
alias cdb='cd ~/.vim/bundle'

# git
alias st='git status'
alias log='git log'
alias diff='git diff'
alias github='open https://github.com'
alias wip='git add -A && git commit -m wip'
alias unwip='git reset head^'

function show_stash {
  git show $(git stash list | cut -d":" -f 1)
}

source ~/bin/git-prompt.sh

PS4='$0:$LINENO '

export MY_BUNDLE_ENV='dev'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

cd ~/$default_directory

alias g='vim --remote-silent'

# open Vim ona buncha files
# vim -o $(grep -rl Factory spec)

function cdgem {
  cd `bundle show $1`
}

function whatchanged_since {
  echo "git whatchanged --since='$@'|ruby -n ~/it.rb|sort -k6|uniq -f5|colrm 1 40"
}

function strip_whitespace {
  find . -name "*.rb" -or -name "*.rake" -or -name "*.feature" -exec sed -i "" 's/[ ]*$//g' {} \;
  find . -name '*.rake' -or -name '*.rb' -or -name '*.feature' -exec sed -i '' 's/ *$//g' {} \;
  find . \( -name '*.rake' -or -name '*.rb' -or -name '*.feature' -or -name '*.html' -or -name '*.haml' \) -exec sed -i '' 's/ *$//g' {} \;
}

function foo {
  echo 'bar'
}
