# command-line-scripts

`smerge` helps you to squash a feature branch in a setup where you are not able (or allowed) to change the git history.

## Install

Just run in your bash shell

```bash
curl https://github.com/newur/command-line-scripts/blob/master/installSmerge.sh | bash
```

## What it does

`smerge` creates a new branch from your base branch - in other words: from where you initially branched off. The new branch is named like your feature branch minus one character at the end. It also deletes the old feature branch on your remote repository. Your local git remains as it is! Just in case. ;)

## How to use `smerge`

Follow the instructions given under _Install_. Afterwards

- `cd` into your git branch you want to squash
- type `smerge` and read the given instruction carefully   <-- only needed once
- type `smerge <full base branch name>`. *Done*

## What does the installation do?

- it copies the `smerge` script to your `~/.bin` folder
- it creates the `smerge` alias in your `~/.bashrc` file
- start a new bash so the alias becomes active
