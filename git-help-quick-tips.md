#Git Quick Sheet

## Files Created on your computer, and you want them on GitHub
- After creating your directory, use `git init` to initialize the folder as a local repository
- Finish working on a file in your local repository
- `git remote add origin https://github.com/rickhenderson/rover.git` for new repository (empty on GitHub, but files on comp)
- `git add -A` for adding all files to the index
- `git commit -m "message"` to commit indexed files to the repository
- `git push -u origin master`
- `git push [my url]` will push committed files to GitHub.
- `git log` to show the list of recent commits, newest at the top by default
- `git status` show the working tree status

## For updating existing Github - update all files
- `git add -A` for adding all files to the index
- `git commit -m "message"` to commit indexed files to the repository
- `git push [my url]` will push committed files to GitHub and request username and password

## Pull from Github.com
You can pull files from the Github repository on to your local repository simply by using
```
  git pull
```

## Files already in a Repo on GitHub but not on your computer yet.
This operation is called `clone`.

* For Windows, you could be using *GitHub for Windows*, or you could run git from the command prompt or use GitBash.
* Linux:
  * Open the terminal, you don't have to create the folder that will contain the repo, but you need to be in the folder where it will be stored.
  * Use `git clone http://github.com/url_you_want`
  * And that should work.
  * More details: https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository

Using GitBash is a great way to have `git` and `python` working well together on a Windows computer.

For *Data Science* or *Data Analysis* you might want to consider using [Anaconda](https://www.continuum.io/downloads) as this provides over 150 packages plus access to over 200 more relating to analysis and charting.

### Using Git with Eclipse
* Install Git using `Help > Install New Software` and use http://download.eclipse.org/egit/updates as the source.
* Import a local Git repository by using `File > Import` and select Git.
  * Might be a problem: Try importing as general project.
