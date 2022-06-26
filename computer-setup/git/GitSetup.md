# Git setup

## Setup separate conf for personal and company usage

In `.gitconfig` file:

```
[include]
	path = ~/.git-avinty-conf
[includeIf "gitdir:~/Documents/personal/"] # this dir using a personal git config
	path = ~/Documents/personal/.git-persional-conf
```

In `.git-company-conf` file:

```
[user]
	name = yourname
	email = yourcompanyemail@comapany.com
```

In `.git-persional-conf` file:

```
[user]
	name = fodorpapbalazsdev
	email = fodorpapbalazsdevp@gmail.com
```