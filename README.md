
# First-Time Setup

Setting up this method for the first time is straightforward. We'll start by creating a **bare Git repository** to track your dotfiles. In this example, we'll use a hidden folder called `.dotfiles`.

```bash
mkdir $HOME/.dotfiles
git init --bare $HOME/.dotfiles
```

### Create a Git Alias

To simplify using Git with your dotfiles, define an alias. This alias allows you to run Git commands on your dotfiles from anywhere:

```bash
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

> 💡 Add this alias to your shell config file (`.bashrc`, `.zshrc`, etc.) so it's available in every terminal session.

From now on, you can use `dotfiles` just like `git`, but it will operate on files in your `$HOME` directory.

### Configure Git and Add a Remote

To keep your status output clean and connect to a remote repository, run:

```bash
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@github.com:yourusername/.dotfiles.git
```

> ✏️ Replace `git@github.com:yourusername/.dotfiles.git` with your own Git repository URL.

### Add and Track Dotfiles

You can now add and track your config files directly from your `$HOME` directory. For example:

```bash
cd $HOME
dotfiles add .tmux.conf
dotfiles commit -m "Add .tmux.conf"
dotfiles push
```

---

# Setting Up a New Machine

To use your dotfiles on a new machine, clone the repository as a **bare repository** and check it out directly into your home directory:

```bash
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/yourusername/.dotfiles.git ~
```

> ⚠️ If you already have existing config files, the checkout may fail due to conflicts.

### Alternative: Use a Temporary Clone Directory

To avoid conflicts with pre-existing files, you can clone to a temporary directory first, then copy the files:

```bash
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/yourusername/.dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```

And that's it—no symlink mess, no complex setup, just version-controlled dotfiles where they belong.
