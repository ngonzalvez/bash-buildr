# bash-buildr
Simple JS and SCSS builder written in Bash-script. This tool is at a very early development stage. It is NOT recommended to use this tool at this moment for other than educational purposes.

### Dependencies
- inotify-tools

### Usage
In order to try it out run ```sh buildr.sh```, A menu will be displayed for you to choose an option. 

Select **(1) Concat JS**. Somce this is the first time that you run the js build, you will be asked for a path to js files. Enter `js/*.js`. Enter `dest/js/` as estination path. That's it! Your files are now being concatenated.

If you want the concatenation to be automatically run on each change to the files, after running buildr select **(3) Watch for changes**
