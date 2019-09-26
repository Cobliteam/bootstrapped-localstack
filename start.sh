#!/usr/bin/env bash

wait_for_ports(){
    for port in "$@"; do
        while ! nc -z localhost "$port"; do
            echo "waiting for $port ..."
            sleep 1
        done
    done
}

run_bootstraped_commands(){
    /opt/code/localstack/service-ports.py | while read -r service ports
    do
        # string to upper on service
        env_var="AWSLOCAL_${service^^}"
        if [ -n "${!env_var}" ]; then 
            # waits for service ports to be ready
            # shellcheck disable=SC2086
            wait_for_ports $ports
            command="awslocal ${service} ${!env_var}"
            # run custom command for service
            bash -c "$command"
        fi
    done
}

# enable job management mode (allow fg command)
set -m

# background localstack execution
docker-entrypoint.sh "$@" &

# run custom commands
run_bootstraped_commands

# foreground localstack
fg
