# Aliases

### Save aliases permanent
To save aliases permanently we need to store them in `zshrc`.

Open `zshrc` with `open ~/.zshrc` or if its already configured then `zshconfig`.

### Current config
Just copy the content into `zshrc` and save it.

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
