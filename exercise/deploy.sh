#!/bin/bash
MYANSIBLE="ansible-playbook -i hosts -u vagrant"

function print_help () {
	echo "Usage: ./deploy.sh all - will deploy all apps"
	echo "Usage: ./deploy.sh getcounter-app - will deploy getcounter-app only"
	echo "Usage: ./deploy.sh pandaimg-app - will deploy pandaimg-app only"

}

case $1 in
    all)
	$MYANSIBLE getcounter-app.yaml
	$MYANSIBLE pandaimg-app.yaml
	;;
    getcounter-app)
	$MYANSIBLE getcounter-app.yaml
	;;
    pandaimg-app)
	$MYANSIBLE pandaimg-app.yaml
	;;
    -h|--help|*)
	print_help
	;;
esac
