if [[ ! $1 == "" ]]; then
  MonitorPath=$1
else
  MonitorPath=/home/pizza2d1/HomeProgramming/SIEMTesting
fi

touch LogSIEMTesting.txt
datatype=""
inotifywait -m -r --format "%e %w%f" $MonitorPath |
while read event fullpath; do
  echo "Fullpath: $fullpath"
  echo "Event: $event"
  if [[ $event == *"ISDIR"* || ${fullpath: -1} == "/" ]]; then
    datatype="FOLDER"
  else
    datatype="FILE"
  fi
  case $event in
    *DELETE*)
      echo "$(date +%D) at $(date +%T) $datatype DELETED: $fullpath" >> LogSIEMTesting.txt
      ;;
    *MODIFY*) #Modified events are rare for some reason, mostly only happen to editing proxy files such as .swp files)
      echo "$(date +%D) at $(date +%T) $datatype MODIFIED: $fullpath" >> LogSIEMTesting.txt
      ;;
    *CREATE*)
      echo "$(date +%D) at $(date +%T) $datatype CREATED: $fullpath" >> LogSIEMTesting.txt
      ;;
    *MOVED_TO*)
      echo "$(date +%D) at $(date +%T) $datatype MOVED TO: $fullpath" >> LogSIEMTesting.txt
      ;;
    *MOVED_FROM*)
      echo "$(date +%D) at $(date +%T) $datatype MOVED FROM: $fullpath" >> LogSIEMTesting.txt
  esac
done
