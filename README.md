# command-line-scripts

`smerge` helps you to squash a feature branch in a setup where you are not able (or allowed) to change the git history.

Get it via

```bash
curl https://github.com/some/not/final/url | bash
```

## What it does

`smerge` creates a new branch from your base branch - in other words: from where you initially branched off. The new branch is named like your feature branch minus one character at the end. It also deletes the old feature branch on your remote repository. Your local git remains as it is! Just in case. ;)

## How to use

Just run the `curl` command from above in a *bash* shell. It will print instructions after the installation. If you want to know in advance:
- it copies the script to your `~/.bin` folder
- it creates the *smerge* alias in your `~/.bashrc` file
- start a new bash so the alias becomes active
- `cd` into your git branch you want to squash
- type `smerge` and read the given instruction carefully
- type `smerge <full base branch name>`. *Done*
