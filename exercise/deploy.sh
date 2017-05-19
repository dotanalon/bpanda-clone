#!/bin/bash
MYANSIBLE="ansible-playbook -i hosts -u vagrant"

function print_help () {
	echo "Usage: ./deploy.sh all - will deploy all apps"
	echo "Usage: ./deploy.sh getcounter-app - will deploy getcounter-app only"
	echo "Usage: ./deploy.sh pandaimg-app - will deploy pandaimg-app only"

}

case $1 in
    all)
	$MYANSIBLE getcounter-app
	$MYANSIBLE pandaimg-app
	;;
    getcounter-app)
	$MYANSIBLE getcounter-app
	;;
    pandaimg-app)
	$MYANSIBLE pandaimg-app
	;;
    -h|--help|*)
	print_help
	;;
esac
