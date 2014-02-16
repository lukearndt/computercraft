## ComputerCraft Stuff

This repo is mainly for private use. It serves as a place for me to store the scripts that I have hacked together for ComputerCraft, which is a mod for Minecraft.

## How to use this

The central component of this system of libraries and programs is the package manager. The best way to make use of my code is to have your computer download and run the latest version of the package manager on startup.

Unfortunately, ComputerCraft leverages pastebin (instead of, say, git) for its code storage. Fortunately, I've uploaded all of my stuff onto pastebin.

In your computer, in game, create and open a file called startup. Do this by typing:

```
edit startup
```


Put the following in to the file:

```lua
shell.run("rm package_manager")
shell.run("pastebin get ad7JAFTJ package_manager")
shell.run("package_manager")
```

This will add all of the public methods in the package manager to your namespace. The key ones are 'execute' and 'load_package'. These actually do the same thing, but I like to separate them conceptually.

### Running one of my programs

To run a specific program through the package manager, create a new file. I like to use the name 'do' because it's easy to type:

```
edit do
```


In the file, just put the following:

```lua
execute("name_of_the_program")
```

A list of programs can be found in the package manager. The more recent ones are better written; I haven't really gone back and cleaned up all of my older stuff.

### Using one of my libraries

If you want to use a library from within a program that you are writing, just load the package at the beginning of your file. For example, if you want to use the TurtleMovement library, put the following at the start of your program:

```lua
load_package("turtle_movement")
```

This will declare all of the library's public methods so that you can use them from within your program.

## License

MIT. Do what you want, no warranty.
