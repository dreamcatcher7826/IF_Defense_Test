1、IF-Defnese.md：实验步骤

2、results文件夹：三种不同的预训练模型在Pointnet或Pointnet++下对应的攻击数据

3、adv_data文件夹：

（1）Add、Add-Cluster、Add-Object、FGM、KNN、Perturb六种攻击的在Pointnet下最终的攻击数据

（2）SRS、SOR、DUP-Net、IF-Defense三种变体（ConvONet-Opt、ONet-Mesh、ONet-Opt）对应以上六种攻击在pointnet网络下的防御数据

4、logs文件夹：

（1）mn40：干净点数数据训练结果

（2）两种防御数据加入混合训练结果

5、代码文件夹：训练使用的部分代码

（Ps：实验过程中对代码进行了部分修改，如batch、训练轮数等，但最终训练数据仍采用的是原数据）