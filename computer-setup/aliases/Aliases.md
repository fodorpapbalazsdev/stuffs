# Aliases

### Save aliases permanent
To save aliases permanently we need to store them in `.zshrc` file.

### Current config
Just copy the content into the right section in [.zshrc](./zshrc/.zshrc) and save it and run 'npm run update' in folder `zshrc`'.

```
###### Own aliases starts here

# General
alias zshconfig="open ~/.zshrc"

# Git related
alias gitupdate='git fetch;git pull'
alias gitdevelop='git checkout develop;gitupdate'
alias gitmain='git checkout main;gitupdate'
alias gitmaster='git checkout master;gitupdate'

# Kafka related
# make sure that the path is correct and scripts are there
alias kstart='sh $HOME/Documents/kafka/kafka-docker/start.sh' # change the path to your kafka dir
alias kstop='sh $HOME/Documents/kafka/kafka-docker/stop.sh' # change the path to your kafka dir

###### Own aliases starts here

# General
alias zshconfig="open ~/.zshrc"

# Git related
alias gitupdate='git fetch;git pull'
alias gitdevelop='git checkout develop;gitupdate'
alias gitmain='git checkout main;gitupdate'
alias gitmaster='git checkout master;gitupdate'

# Kafka related
# make sure that the path is correct and scripts are there
alias kstart='sh $HOME/Documents/kafka/kafka-docker/start.sh' # change the path to your kafka dir
alias kstop='sh $HOME/Documents/kafka/kafka-docker/stop.sh' # change the path to your kafka dir

# Docker related
alias  dockerip='docker ps | tail -n +2 | while read cid b; do echo -n "$cid\t"; docker inspect $cid | grep IPAddress | cut -d \" -f 4; done'

# project related
alias cdstuffs='cd $HOME/Documents/personal/repositories/stuffs'
alias cdclient='cd $HOME/Documents/repositories/epd/client'
alias cdcare='cd $HOME/Documents/repositories/epd/care'
alias cdjur='cd $HOME/Documents/repositories/epd/juridical'
alias cdjuridical='cdjur'
alias cdmain='cd $HOME/Documents/repositories/epd/main'

# intelliJ IDEA related
alias istuffs='cdstuffs && idea .'
alias iclient='cdclient && idea .'
alias icare='cdcare && idea .'
alias ijuridical='cdjuridical && idea .'
alias ijur='ijuridical'
alias imain='cdmain && idea .'

###### Own aliases ends here
```
