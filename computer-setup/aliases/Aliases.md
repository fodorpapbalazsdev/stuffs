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
alias kafka-start='sh $HOME/Documents/kafka/kafka-docker/start.sh' # change the path to your kafka dir
alias kafka-stop='sh $HOME/Documents/kafka/kafka-docker/stop.sh' # change the path to your kafka dir

###### Own aliases ends here
```
