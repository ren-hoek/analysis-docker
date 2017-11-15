# Configuration file for jupyterhub.

import os

c = get_config() # noqa
pwd = os.path.dirname(__file__)

c.JupyterHub.spawner_class = 'cassinyspawner.SwarmSpawner'

c.JupyterHub.ip = '0.0.0.0'
c.JupyterHub.hub_ip = '0.0.0.0'

c.JupyterHub.cleanup_servers = False

# First pulls can be really slow, so let's give it a big timeout
c.SwarmSpawner.start_timeout = 60 * 5

c.SwarmSpawner.jupyterhub_service_name = 'jupyterpip'

c.SwarmSpawner.networks = ["jupyterhub"]

notebook_dir = os.environ.get('NOTEBOOK_DIR') or '/home/jupyter/work'
c.SwarmSpawner.notebook_dir = notebook_dir

mounts = [{'type': 'bind',
           'source': '/var/lib/nvidia-docker/volumes/nvidia_driver/384.90',
           'target': '/usr/local/nvidia'},
          {'type': 'bind',
           'source': '/home',
           'target': '/home'},
          {'type': 'bind',
           'source': '/etc/passwd',
           'target': '/etc/passwd'},
          {'type': 'bind',
           'source': '/etc/shadow',
           'target': '/etc/shadow'},
          {'type': 'bind',
           'source': '/etc/group',
           'target': '/etc/group'},
          {'type': 'bind',
           'source': '/etc/gshadow',
           'target': '/etc/gshadow'},
          {'type': 'bind',
           'source': '/etc/sudoers',
           'target': '/etc/sudoers'}
        ]

devices = [{'PathOnHost': '/dev/nvidiactl',
             'PathInContainer': '/dev/nvidiactl',
             'CgroupPermissions': 'rwm'
            },
            {'PathOnHost': '/dev/nvidia-uvm',
             'PathInContainer': '/dev/nvidia-uvm',
             'CgroupPermissions': 'rwm'
            },
            {'PathOnHost': '/dev/nvidia0',
             'PathInContainer': '/dev/nvidia0',
             'CgroupPermissions': 'rwm'
            }]

c.SwarmSpawner.container_spec = {
    # The command to run inside the service
    'args': ['/usr/local/bin/start-singleuser.sh',
        '--NotebookApp.default_url=/lab'],  # (string or list)
    'Image': 'analysis/gpu-notebook',
    'mounts': mounts,
    'devices': devices
}

