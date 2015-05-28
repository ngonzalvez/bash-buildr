# bash-buildr
Simple JS and SCSS builder written in Bash-script. This tool is at a very early development stage. It is NOT recommended to use this tool at this moment for other than educational purposes.

#### Why not just use Gulp.js or any other of its kind?
Mostly because of performance. I myself have had some performance issues when using Gulp.js, mostly when running many tasks. JS compilation took quite a few seconds in large projects. 

Therefore, I'm trying to make this tool as performant as possible through a simple architecture and by keeping the list of dependencies as minimal as possible.

#### Dependencies
- inotify-tools
- uglify-js (global npm module)

#### Usage
In order to try it out run ```sh buildr.sh```. A menu will be displayed for you to choose an option. 

- Select **(1) Compress JS**. 
- Enter the path to js files: `js/*.js`.
- Enter the path to the directory where the compiled files will be located: `dest/js`.
- Enter the name of the compiled JS: `app.js`.

Now you'll see a message saying that your JS files were compressed. Same steps apply for CSS compression.

For automatic compression on each change to a JS/CSS file select **(3) Watch for changes**
