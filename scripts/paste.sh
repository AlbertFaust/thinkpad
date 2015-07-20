#'COMMAND' | curl -F c=@- https://ptpb.pw
echo 'Enter Command: '
read command
echo | $command | curl -F c=@- https://ptpb.pw
