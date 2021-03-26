# Ruby Tools

**Gems** are packages of code that you can download, install and use in Ruby programs. The `gem` command manages Gems. `gem` comes with standard Ruby installation. 

**How to find and install gems**:

- search RubyGems website, find gem you want to install
- run `gem install` to install the gem on your system

***

### The Remote Library

- Using the `gem` command connects to the remote library, which downloads the gems and installs them. 

- Use the `RubyGems Library`, a remote Gem library

### The Local Library

- When `gem` installs a gem, it places it in your system in a place where Ruby and your system can find the files and commands it needs.
- This is the local library
- The location of the local library depends of factors: 
  - whether or not we're using a system Ruby that needs root access
  - a user maintainable Ruby
  - the specific Ruby version number
  - whether or not we're using a Ruby version manager (rvm)

### Gems and your File System

- use `gem env` to view where `gem` put things