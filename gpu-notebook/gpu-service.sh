docker service create \
	--mount type=bind, src=/var/lib/nvidia-docker/volumes/nvidia_driver/384.90 ,dst=/usr/local/nvidia \
	--mount type=bind, src=/etc/passwd, dst=/etc/passwd \
	--mount type=bind, src=/etc/shadow, dst=/etc/shadow \
	--mount type=bind, src=/etc/group, dst=/etc/group \
	--mount type=bind, src=/etc/gshadow, dst=/etc/gshadow \
	--mount type=bind, src=/home, dst=/home \
	--env USER=$(whoami) \
	--env LD_LIBRARY_PATH='/usr/local/nvidia/lib:/usr/local/nvidia/lib64:/usr/local/cuda-8.0/lib64' \
	--env PATH='/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' \
	--env CUDA_VERSION='8.0.61' \
	--env NVIDIA_CUDA_VERSION='8.0.61' \
	--env CUDA_PKG_VERSION='8-0=8.0.61-1' \
	--env NVIDIA_VISIBLE_DEVICES='all' \
	--env NVIDIA_DRIVER_CAPABILITIES='compute,utility' \
	--device /dev/nvidiactl:/dev/nvidiactl \
	--device /dev/nvidia-uvm:/dev/nvidia-uvm \
	--device /dev/nvidia0:/dev/nvidia0 \
	--publish 8888:8888 \
	--name nvidia \
	--network jupyterhub analysis/gpu-notebook

