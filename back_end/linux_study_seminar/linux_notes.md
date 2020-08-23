
## Chapter 1: What is the Shell?

- the shell is a program that takes a series of keyboard commands and sends them to the operating system to carry out
- almost all linux distros supply a shell program, called `bash`
- `bash` is an acronym for `Bourne Again SHell`
- `bash` is a enhanced replacement for the original Unix shell program written by Steve Bourne called `sh`

---

### Terminal Emulators

- we use a terminal emulator to interact with the shell
- KDE uses `konsole` while GNOME uses `gnome-terminal`
- they all do the same thing; they give us access to the shell

---

### First Commands

- `[felicia@linux ~]$` this is the **shell prompt**
- it follows this syntax: `username@machinename`, followed by the current working directory and a `$`
- it appears like this when it is ready to accept input
- note: if the last character is a `#` sign then the terminal session has `superuser` privileges
- to view **command history**, press the up array `^`

---

### A Few Commands

- **date**: shows the current date and time
- **cal**: shows a calendar of the current month
- **df**: shows current amount of free space on our disk drives
- **free**: shows the amount of free memory
- **exit**: exits the session

---

## Chapter 2: Navigation

### Understanding the File System Tree

- Unix-like systems, like Windows, organizes its files in a **hieracrchical directory structure**
- this means that the files are organized in a tree-like pattern of **directories** (or folders) that may contain files or other directories
- the first directory in the file system is the **root** directory
- the **root** directory contains files and subdirectories
- linux has a single file system tree, unlike windows, which has a seperate file system tree for each storage device

### The Current Working Directory

- the file system tree for linux in a graphical file manager is shown upended, with the root folder at the top and the various folders below it
- the **current working directory** is the directory we are current standing in
- use command `pwd` (print working directory) to view the current working directory
- `[felicia@linux ~]$ pwd`

    `/home/me`

- the current working directory when we start a new terminal session is the **home** directory
- every user account is given a home directory and it's the only place a regular user can write files

### Listing the Contents of a Directory

- use command `ls` to view a list of the files and directories in the current working directory

### Changing the Current Working Directory

- use command `cd` followed by the `pathname` of the desired working directory to change our working directory
- the `pathname` is the route we take to get to the directory we want

### Absolute Pathnames

- the **absolute** pathname begins with the **root directory** and follows the tree branch to get to the desired directory
- the root directory is represented by a leading slash `/`

### Relative Pathnames

- the **relative pathname** begins from the **working directory**
- the `.` (dot) notation refers to the **working directory**
- the `..` (dot dot) notation refers to the **working directory's parent directory (preferred)**
- we can either use `..` (dot dot) notation to change to the parent's directory (one up from the one you're currently in) or we can use the absolute pathname `cd /usr`
- to change from a parent directory to a child directory, we could use absolute pathname: `cd /usr/bin` or relative pathname: `cd ./bin` (the dot represents the directory we're currently in, then we specify the child folder we want to change to)
- we don't even need to specify the current directory we're in to change to a child directory; it's assumed: `cd bin`

### Shortcuts

- `cd`: changes the working directory to the **home** directory
- `cd-`: changes the working directory to the **previous** working directory (works the same as `cd ..`
- `cd ~user_name`: changes the working directory to the home directory of the *user_name*

### Filenames

- files that begin with a period are hidden files
- `ls` will not list these files unless you use command `ls -a`
- filenames and commands are case sensitive
- linux has no concept of file extensions
- use underscores to represent spaces in filenames
