#!/usr/bin/python3.6

# return ports needed for services defined in SERVICES

from localstack import config, constants

for service, ports in config.parse_service_ports().items():
   backend_port_varname = 'DEFAULT_PORT_' + service.upper() + '_BACKEND'
   if (hasattr(constants, backend_port_varname)):
      backend_port = getattr(constants, backend_port_varname)
      ports = str(ports) + ' ' + str(backend_port)
   print(service, ports)