#!/bin/bash
CUDA_VISIBLE_DEVICES=0 python defend_npz.py --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Add-pointnet2-conv.npz' --defense=''
CUDA_VISIBLE_DEVICES=0 python defend_npz.py --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Cluster-pointnet2-conv.npz' --defense=''
CUDA_VISIBLE_DEVICES=0 python defend_npz.py --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Drop-pointnet2-conv.npz' --defense=''
CUDA_VISIBLE_DEVICES=0 python defend_npz.py --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/fgm-pointnet2-conv.npz' --defense=''
CUDA_VISIBLE_DEVICES=0 python defend_npz.py --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/kNN-pointnet2-conv.npz' --defense=''
CUDA_VISIBLE_DEVICES=0 python defend_npz.py --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Object-pointnet2-conv.npz' --defense=''
CUDA_VISIBLE_DEVICES=0 python defend_npz.py --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Perturb-pointnet2-conv.npz' --defense=''

cd ..
cd ConvONet
python setup.py build_ext --inplace
CUDA_VISIBLE_DEVICES=0 python opt_defense.py --sample_npoint=1024 --train=False --rep_weight=500.0 --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Add-pointnet2-conv.npz'
CUDA_VISIBLE_DEVICES=0 python opt_defense.py --sample_npoint=1024 --train=False --rep_weight=500.0 --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Cluster-pointnet2-conv.npz'
CUDA_VISIBLE_DEVICES=0 python opt_defense.py --sample_npoint=1024 --train=False --rep_weight=500.0 --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Drop-pointnet2-conv.npz'
CUDA_VISIBLE_DEVICES=0 python opt_defense.py --sample_npoint=1024 --train=False --rep_weight=500.0 --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/fgm-pointnet2-conv.npz'
CUDA_VISIBLE_DEVICES=0 python opt_defense.py --sample_npoint=1024 --train=False --rep_weight=500.0 --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/kNN-pointnet2-conv.npz'
CUDA_VISIBLE_DEVICES=0 python opt_defense.py --sample_npoint=1024 --train=False --rep_weight=500.0 --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Object-pointnet2-conv.npz'
CUDA_VISIBLE_DEVICES=0 python opt_defense.py --sample_npoint=1024 --train=False --rep_weight=500.0 --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Perturb-pointnet2-conv.npz'

cd ..
cd ONet
python setup.py build_ext --inplace
CUDA_VISIBLE_DEVICES=0 python remesh_defense.py --sample_npoint=1024 --train=False --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Add-pointnet2-conv.npz'
CUDA_VISIBLE_DEVICES=0 python remesh_defense.py --sample_npoint=1024 --train=False --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Cluster-pointnet2-conv.npz'
CUDA_VISIBLE_DEVICES=0 python remesh_defense.py --sample_npoint=1024 --train=False --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Drop-pointnet2-conv.npz'
CUDA_VISIBLE_DEVICES=0 python remesh_defense.py --sample_npoint=1024 --train=False --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/fgm-pointnet2-conv.npz'
CUDA_VISIBLE_DEVICES=0 python remesh_defense.py --sample_npoint=1024 --train=False --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/kNN-pointnet2-conv.npz'
CUDA_VISIBLE_DEVICES=0 python remesh_defense.py --sample_npoint=1024 --train=False --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Object-pointnet2-conv.npz'
CUDA_VISIBLE_DEVICES=0 python remesh_defense.py --sample_npoint=1024 --train=False --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Perturb-pointnet2-conv.npz'

CUDA_VISIBLE_DEVICES=0 python opt_defense.py --sample_npoint=1024 --train=False --rep_weight=500.0 --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Add-pointnet2-conv.npz'
CUDA_VISIBLE_DEVICES=0 python opt_defense.py --sample_npoint=1024 --train=False --rep_weight=500.0 --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Cluster-pointnet2-conv.npz'
CUDA_VISIBLE_DEVICES=0 python opt_defense.py --sample_npoint=1024 --train=False --rep_weight=500.0 --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Drop-pointnet2-conv.npz'
CUDA_VISIBLE_DEVICES=0 python opt_defense.py --sample_npoint=1024 --train=False --rep_weight=500.0 --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/fgm-pointnet2-conv.npz'
CUDA_VISIBLE_DEVICES=0 python opt_defense.py --sample_npoint=1024 --train=False --rep_weight=500.0 --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/kNN-pointnet2-conv.npz'
CUDA_VISIBLE_DEVICES=0 python opt_defense.py --sample_npoint=1024 --train=False --rep_weight=500.0 --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Object-pointnet2-conv.npz'
CUDA_VISIBLE_DEVICES=0 python opt_defense.py --sample_npoint=1024 --train=False --rep_weight=500.0 --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/adv_data_conv/Perturb-pointnet2-conv.npz'

