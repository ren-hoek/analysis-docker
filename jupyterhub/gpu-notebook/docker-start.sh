docker run -d \
	-v /var/lib/nvidia-docker/volumes/nvidia_driver/384.90:/usr/local/nvidia \
	-v /etc/passwd:/etc/passwd \
	-v /etc/shadow:/etc/shadow \
	-v /etc/group:/etc/group \
	-v /etc/gshadow:/etc/gshadow \
	-v /home:/home \
	-e USER=$(whoami) \
	-e LD_LIBRARY_PATH='/usr/local/nvidia/lib:/usr/local/nvidia/lib64:/usr/local/cuda-8.0/lib64' \
	-e PATH='/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' \
	-e CUDA_VERSION='8.0.61' \
	-e NVIDIA_CUDA_VERSION='8.0.61' \
	-e CUDA_PKG_VERSION='8-0=8.0.61-1' \
	-e NVIDIA_VISIBLE_DEVICES='all' \
	-e NVIDIA_DRIVER_CAPABILITIES='compute,utility' \
	--device /dev/nvidiactl:/dev/nvidiactl \
	--device /dev/nvidia-uvm:/dev/nvidia-uvm \
	--device /dev/nvidia0:/dev/nvidia0 \
	-p 8888:8888 \
	--name gpu_notebook \
	jupyter/gpu-notebook

