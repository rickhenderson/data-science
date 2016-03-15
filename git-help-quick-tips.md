#Git Quick Sheet

- After creating your directory, use `git init` to initialize the folder as a local repository
- Finish working on a file in your local repository
- `git remote add origin https://github.com/rickhenderson/rover.git` for new repository (empty on GitHub, but files on comp)
- `git add -A` for adding all files to the index
- `git commit -m "message"` to commit indexed files to the repository
- `git push -u origin master`
- `git push [my url]` will push committed files to GitHub.
- `git log` to show the list of recent commits, newest at the top by default
- `git status` show the working tree status

# For updating existing Github - update all files
- `git add -A` for adding all files to the index
- `git commit -m "message"` to commit indexed files to the repository
- `git push [my url]` will push committed files to GitHub and request username and password

# Pull from Github.com
You can pull files from the Github repository on to your local repository simply by using
```
  git pull
```

Using GitBash is a great way to have `git` and `python` working well together on a Windows computer.

For *Data Science* or *Data Analysis* you might want to consider using [Anaconda](https://www.continuum.io/downloads) as this provides over 150 packages plus access to over 200 more relating to analysis and charting.
