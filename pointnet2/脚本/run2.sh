#!/bin/bash
python util/merge_attack_results.py --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/attack/results/conv_opt_mn40_1024/Add/chamfer/Add-pointnet2-logits_kappa=0.0-success_'
python util/merge_attack_results.py --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/attack/results/conv_opt_mn40_1024/Cluster/3-32/Cluster-pointnet2-logits_kappa=0.0-success_'
python util/merge_attack_results.py --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/attack/results/conv_opt_mn40_1024/FGM/pointnet2/fgm-budget_0.08-iter_20-success_'
python util/merge_attack_results.py --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/attack/results/conv_opt_mn40_1024/kNN/kNN-pointnet2-logits_kappa=15.0-success_.npz'
python util/merge_attack_results.py --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/attack/results/conv_opt_mn40_1024/Object/3-64/Object-pointnet2-logits_kappa=0.0-success_.npz'
python util/merge_attack_results.py --data_root='/public/home/xiaoyu_zhou/usr22/syq_inte22/IF-Defense-main/baselines/attack/results/conv_opt_mn40_1024/Perturb/Perturb-pointnet2-logits_kappa=0.0-success_'
