1、IF-Defnese.md：实验步骤

2、Pointnet：

（1）results文件夹：三种不同的预训练模型在Pointnet下对应的攻击数据

（2）adv_data文件夹：

​	①Add、Add-Cluster、Add-Object、FGM、KNN、Perturb六种攻击在Pointnet下最终的攻击数据

​	②SRS、SOR、DUP-Net、IF-Defense三种变体（ConvONet-Opt、ONet-Mesh、ONet-Opt）对应以上六种攻击在Pointnet网络下的防御数据

（3）logs文件夹：

​	①mn40：干净点数数据训练结果

​	②两种防御数据加入混合训练结果

（4）代码文件夹：训练使用的部分代码

（Ps：实验过程中对代码进行了部分修改，如batch、训练轮数等，但最终训练数据仍采用的是原数据）

3、Pointnet++：

（1）results文件夹：三种不同的预训练模型在Pointnet++下对应的攻击数据

（2）adv_data_conv文件夹（预训练模型为conv_opt_mn40）：

​	①Add、Add-Cluster、Add-Object、FGM、KNN、Perturb、Drop-200七种攻击在Pointnet++下最终的攻击数据

​	②SRS、SOR、DUP-Net、IF-Defense三种变体（ConvONet-Opt、ONet-Mesh、ONet-Opt）对应以上六种攻击在Pointnet++网络下的防御数据

（2）adv_data_opt文件夹（预训练模型为opt_mn40）：

​	①Add、Add-Cluster、Add-Object、FGM、KNN、Perturb、Drop-200七种攻击在Pointnet++下最终的攻击数据

​	②SRS、SOR、DUP-Net、IF-Defense三种变体（ConvONet-Opt、ONet-Mesh、ONet-Opt）对应以上六种攻击在Pointnet++网络下的防御数据

（4）代码文件夹：修改了batch、binary_step、num_iter后的攻击训练代码

（5）脚本文件夹：攻击训练(run1.sh)、数据合并(run2.sh)、防御训练(run3.sh)、防御测试(run4.sh)所使用的命令写的脚本。（还训练了预训练数据为opt_mn40的数据，但是由于还未完全测试完，此处只写了conv_opt_mn40的。）

