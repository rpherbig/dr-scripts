if [ $# -lt 1 ]; then
  echo "Usage: ./create_symlinks.sh path/to/lich/scripts"
  exit 1
fi

destination=$1

# Delete all symlinks from lich/scripts
find $1 -maxdepth 1 -type l -exec rm -f {} \;

# Link all the things
ln -s `pwd`/*.lic $1
ln -s `pwd`/profiles/ $1
