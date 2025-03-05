realpath () 
{
    f=$@; # Get the argument given to the function realpath on variable f
    if [ -z "$f" ]; then # Check if var f is empty, if so f is equal to the actual repository(pwd)
      f=$(pwd)
    fi #Close the if
    if [ -d "$f" ]; then # Check if var f is a directory
        base=""; # If so, var base is empty
        dir="$f"; # And var dir is equal to that directory that has been given to the function
    else
        base="/$(basename "$f")"; # if is not a directory(so is a file), we get the name of the file from the var f
        dir=$(dirname "$f"); # extract the directory that has the given file
    fi; #Close the if block
    dir=$(cd "$dir" && /bin/pwd -P); # Convert dir to an absolute direction
    echo "$dir$base" # Print this route
}
