nvidia-docker run -d \
	-v /etc/passwd:/etc/passwd \
	-v /etc/shadow:/etc/shadow \
	-v /etc/group:/etc/group \
	-v /etc/gshadow:/etc/gshadow \
	-v /home:/home \
	-e USER=$(whoami) \
	-e LD_LIBRARY_PATH='/usr/local/nvidia/lib:/usr/local/nvidia/lib64:/usr/local/cuda-8.0/lib64' \
	-p 8888:8888 \
	--name gpu_notebook \
	jupyter/gpu-notebook

