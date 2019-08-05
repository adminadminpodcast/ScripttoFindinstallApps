## Locatation of where to store logs of installed Apps
filepath="/home/alister/Al Scripts/appinstalled.txt"
## Create File if does not exist
if [ ! -f "$filepath" ]; then
    touch "$filepath"
fi
## Load a Lists of Cmds already add to above file and put it into array
ListofCMDS=()
input="/home/alister/Al Scripts/appinstalled.txt"
while IFS= read -r line2; do
  ListofCMDS+=( "$line2" )
done < "$filepath"
## Pull the lists of cmds from the history and put in into array
History=()
while read line; do
  History+=( "$line" )
done < <(history | grep -e "apt install" -e "snap install" -e "apt-get install" -e  "add-apt-repository ppa")
## Compares both the Cmds from History and File and create new array with unquie Cmds
readarray -t unique < <( \
    comm -23 \
        <(printf '%s\n' "${History[@]}" | sort) \
        <(printf '%s\n' "${ListofCMDS[@]}" | sort) \
)
## Put the the Array in number order
IFS=$'\n'  ## only word-split on '\n'
unique=( $(printf "%s\n" ${unique[@]} | sort -n ) )  ## 
## Appends the unique commands to the file
for item in "${unique[@]}"; do
echo "$item"
echo "$item" >> "$filepath"
done
