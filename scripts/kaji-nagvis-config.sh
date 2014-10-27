#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


echo "Set Nagvis Configuration"

# set nagvis configuration
sed -i "/etc/nagvis/nagvis.ini.php" \
  -e "s#.*htmlcgi=\(.*\)#;htmlcgi=\1#" \
  -e "s#socket=\"unix:/var/lib/icinga/rw/live\"#socket=\"tcp:localhost:50000\"#" \
  -e "s#;hosturl=.*#hosturl=\"/status/detail?host_name=[host_name]\"#" \
  -e "s#;hostgroupurl=.*#hostgroupurl=\"/status/detail?hostgroup_name=[hostgroup_name]\"#" \
  -e "s#;serviceurl=.*#serviceurl=\"/status/detail?host_name=[host_name]\&service_description=[service_description]\"#" \
  -e "s#;servicegroupurl=.*#servicegroupurl=\"/status/detail?servicegroup_name=[servicegroup_name]\"#" \
  -e "s#;urltarget=\"_self\"#urltarget=\"_blank\"#" \
  -e "s#\[backend_live_1\]#[backend_localhost:50000]#" \
  -e "s#;backend=\"live_1\"#backend=\"localhost:50000\"#"

echo "Done"

exit 0


#sed -i "/etc/nagvis/nagvis.ini.php" \
#  -e "s#.*htmlcgi=\(.*\)#;htmlcgi=\1#" \
#  -e "s#socket=\"unix:/var/lib/icinga/rw/live\"#socket=\"tcp:localhost:50000\"#" \
#  -e "s#;hosturl=.*#hosturl=\"/status/detail?host_name=[host_name]\&backend=[backend_id]\"#" \
#  -e "s#;hostgroupurl=.*#hostgroupurl=\"/status/detail?hostgroup_name=[hostgroup_name]\"#" \
#  -e "s#;serviceurl=.*#serviceurl=\"/status/detail?host_name=[host_name]\&service_description=[service_description]\&backend=[backend_id]\"#" \
#  -e "s#;servicegroupurl=.*#servicegroupurl=\"/status/detail?servicegroup_name=[servicegroup_name]\"#" \
#  -e "s#;urltarget=\"_self\"#urltarget=\"_blank\"#" \
#  -e "s#\[backend_live_1\]#[backend_localhost:50000]#" \
#  -e "s#;backend=\"live_1\"#backend=\"localhost:50000\"#"
