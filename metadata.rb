name                'docker_monitor'
maintainer          'Vytautas Stanaitis'
maintainer_email    'vytautas@basas.lt'
license             'All Rights Reserved'
description         'Installs and configures Docker for monitoring system and show reports'
source_url          'https://github.com/basas/docker_monitor'
issues_url          'https://github.com/basas/docker_monitor/issues'
chef_version        '>= 15.0'
version             '1.0.0'

supports            'centos'

depends             'docker', '= 7.0'
depends             'prometheus_exporters', '= 0.17.2'
