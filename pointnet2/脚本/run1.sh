#!/bin/bash
NCCL_DEBUG=INFO CUDA_VISIBLE_DEVICES=0 python -m torch.distributed.launch --nproc_per_node=1 --master_port=29501 attack_scripts/targeted_add_attack.py --model=pointnet2 --dist_func=chamfer --num_points=1024 --dataset=conv_opt_mn40
NCCL_DEBUG=INFO CUDA_VISIBLE_DEVICES=0 python -m torch.distributed.launch --nproc_per_node=1 --master_port=29501 attack_scripts/targeted_add_cluster_attack.py --num_add=3 --cl_num_p=32 --model=pointnet2 --num_points=1024 --dataset=conv_opt_mn40
NCCL_DEBUG=INFO CUDA_VISIBLE_DEVICES=0 python -m torch.distributed.launch --nproc_per_node=1 --master_port=29501 attack_scripts/targeted_fgm_attack.py --model=pointnet2 --attack_type=FGM --num_points=1024 --dataset=conv_opt_mn40
NCCL_DEBUG=INFO CUDA_VISIBLE_DEVICES=0 python -m torch.distributed.launch --nproc_per_node=1 --master_port=29501 attack_scripts/targeted_knn_attack.py --model=pointnet2 --num_points=1024 --dataset=conv_opt_mn40
NCCL_DEBUG=INFO CUDA_VISIBLE_DEVICES=0 python -m torch.distributed.launch --nproc_per_node=1 --master_port=29501 attack_scripts/targeted_add_object_attack.py --num_add=3 --obj_num_p=64 --model=pointnet2 --num_points=1024 --dataset=conv_opt_mn40
NCCL_DEBUG=INFO CUDA_VISIBLE_DEVICES=0 python -m torch.distributed.launch --nproc_per_node=1 --master_port=29501 attack_scripts/targeted_perturb_attack.py --model=pointnet2 --num_points=1024 --dataset=conv_opt_mn40
CUDA_VISIBLE_DEVICES=0 python attack_scripts/untargeted_drop_attack.py --model=pointnet2 --num_drop=200 --num_points=1024 --dataset=conv_opt_mn40
