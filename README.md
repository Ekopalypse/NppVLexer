# NppVLexer
A V lexer plugin for Notepad++ (ONLY 64bit version available)

## Installation

- Download and unpack the NppVLexer zip-archive from https://github.com/Ekopalypse/NppVLexer/releases to the folder "Notepad++\plugins".


## Usage example

- Start Notepad++
- Open a V source file


## Building manually

This plugin is written in the [programming language V](https://github.com/vlang/v) and must therefore be available to build this plugin.  
Furthermore, a current version of the gcc compiler, >= version 10 recommended, must be installed.  


```
cd into cloned repository and run
v.exe -cc gcc -d static_boehm -gc boehm -enable-globals -shared -d no_backtrace -prod -cflags -static-libgcc -o VLang.dll .
```


## Release History
* 0.3
	* make nested comment blocks possible
* 0.2
	* updated to version V 0.2.4 cb60392
* 0.1
    * stable version

## Meta

Distributed under the MIT license. See ``LICENSE`` for more information.