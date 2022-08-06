#### 一、环境配置

1. 环境：Python 3.7.7、PyTorch 1.5.0、CUDA10.1
2. 创建虚拟环境：conda create -n IF-Defense python=3.7
   	                       conda activate IF-Defense
3. 安装必需的包：python -m pip install -r requirements.txt
4. 安装torch、torchvision、torch-scatter：conda install pytorch==1.5.0 torchvision==0.6.0 cudatoolkit=10.1 -c pytorch

#### 二、网络模型训练

1. 训练干净数据集：

   CUDA_VISIBLE_DEVICES=0 python train.py --model={$MODEL} --num_points=1024

2. 混合训练：

   CUDA_VISIBLE_DEVICES=0 python hybrid_train.py --model={$MODEL} --num_points=1024 --dataset={$DATASET} --def_data=path/to/defense_data.npz

#### 三、攻击训练

1. 命令格式：

   （1）Add：

   NCCL_DEBUG=INFO CUDA_VISIBLE_DEVICES=0 python -m torch.distributed.launch --nproc_per_node=1 --master_port=29501 attack_scripts/targeted_add_attack.py --model={$MODEL} --dist_func=chamfer/hausdorff --num_points=1024 --dataset={$DATASET}

   （2）Add_Cluster：

   NCCL_DEBUG=INFO CUDA_VISIBLE_DEVICES=0 python -m torch.distributed.launch --nproc_per_node=1 --master_port=29501 attack_scripts/targeted_add_cluster_attack.py --num_add=3 --cl_num_p=32 --model={$MODEL} --num_points=1024 --dataset={$DATASET}

   （3）Add_Object：

   NCCL_DEBUG=INFO CUDA_VISIBLE_DEVICES=0 python -m torch.distributed.launch --nproc_per_node=1 --master_port=29501 attack_scripts/targeted_add_object_attack.py --num_add=3 --obj_num_p=64 --model={$MODEL} --num_points=1024 --dataset={$DATASET}

   （4）FGM：

   NCCL_DEBUG=INFO CUDA_VISIBLE_DEVICES=0 python -m torch.distributed.launch --nproc_per_node=1 --master_port=29501 attack_scripts/targeted_fgm_attack.py --model={$MODEL} --attack_type=FGM/IFGM/MIFGM/PGD --budget={$BUDGET} --num_iter={$NUM_ITER} --num_points=1024 --dataset={$DATASET}

   （5）KNN：

   NCCL_DEBUG=INFO CUDA_VISIBLE_DEVICES=0 python -m torch.distributed.launch --nproc_per_node=1 --master_port=29501 attack_scripts/targeted_knn_attack.py --model={$MODEL} --num_points=1024 --dataset={$DATASET}

   （6）Perturb：

   NCCL_DEBUG=INFO CUDA_VISIBLE_DEVICES=0 python -m torch.distributed.launch --nproc_per_node=1 --master_port=29501 attack_scripts/targeted_perturb_attack.py --model={$MODEL} --num_points=1024 --dataset={$DATASET}

2. 训练内容：Add、Add-Cluster、Add-Object、FGM、KNN、Perturb

3. 训练的分类网络：PointNet、PointNet++

4. 训练使用的预训练模型：conv_opt_mn40、opt_mn40

5. 训练生成文件：攻击结果（.npz文件）

#### 四、防御训练

1. 命令格式：

   （1）SRS/SOR/DUP-Net：

   CUDA_VISIBLE_DEVICES=0 python defend_npz.py --data_root=path/to/adv_data.npz --defense=srs/sor/dup/''

   （2）ConvONet：

   CUDA_VISIBLE_DEVICES=0 python opt_defense.py --sample_npoint=1024 --train=False --rep_weight=500.0 --data_root=path/to/adv_data.npz

   （3）ONet-Mesh：

   CUDA_VISIBLE_DEVICES=0 python remesh_defense.py --sample_npoint=1024 --train=False --data_root=path/to/adv_data.npz

   （4）ONet-Opt：

   CUDA_VISIBLE_DEVICES=0 python opt_defense.py --sample_npoint=1024 --train=False --rep_weight=500.0 --data_root=path/to/adv_data.npz

   （对于ConvONet、ONet-Mesh、ONet-Opt，需要使用python setup.py build_ext --inplace来编译一些扩展模块）

2. 训练内容：SRS、SOR、DUP-Net、IF-Defense三种变体（ConvNet、ONet-Mesh、ONet-Opt）

3. 训练的攻击方式：Add、Add-Cluster、Add-Object、FGM、KNN、Perturb

4. 训练生成文件：防御结果（.npz文件）

#### 五、防御测试

1. 命令格式：CUDA_VISIBLE_DEVICES=0 python inference.py --num_points=1024 --mode=normal/target --model={$MODEL} --normalize_pc=True/False --dataset={$DATASET} --data_root=path/to/test_data.npz
2. 测试内容：SRS、SOR、DUP-Net、IF-Defense三种变体（ConvNet、ONet-Mesh、ONet-Opt）对Add、Add-Cluster、Add-Object、FGM、KNN、Perturb的防御效果即在攻击下的识别准确度
3. 测试使用的预训练模型：conv_opt_mn40
4. 测试结果：DUP-Net、IF-Defense三种变体都呈现出了较好的效果，但是DUP-Net对某些攻击而言（如FGM）效果仍不理想，而IF-Defense的三种变体对于这一情况有一定的改善。整体来说效果较好的是IF-Defense中的ConvONet变体，对于大部分攻击方式，ConvONet呈现出了与其他两种变体相当甚至更好的效果。