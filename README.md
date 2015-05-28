# bash-buildr
Simple JS and SCSS builder written in Bash-script. This tool is at a very early development stage. It is NOT recommended to use this tool at this moment for other than educational purposes.

#### Why not just use Gulp.js or any other of its kind?
Mostly because of performance. I myself have had some performance issues when using Gulp.js, mostly when running many tasks. JS compilation took a quite few seconds in large projects. 

Therefore, I'm trying to make this tool as performant as possible through a simple architecture and by keeping the list of dependencies as minimal as possible.

#### Dependencies
- inotify-tools

#### Usage
In order to try it out run ```sh buildr.sh```. A menu will be displayed for you to choose an option. 

Select **(1) Concat JS**. The first time you'll be asked for a path to js files and destination file. Enter `js/*.js` as source and `dest/js/` as destination path. 

Now you'll see a message saying your JS files were concatenated. 

For automatic concatenation on each change to a JS file select **(3) Watch for changes**
