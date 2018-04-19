贝叶斯公式
===========
![test image size](https://gss2.bdstatic.com/9fo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D250/sign=f31b413dd3a20cf44290f9da46084b0c/5fdf8db1cb134954a3ba2ede554e9258d0094ae0.jpg)

三要素

(1) 先验概率 P(theta)

(2) 似然函数 P(data|theta)

(3) 后验概率 P(theta|data)

P(theta|data) = P(data, theta) / P(data) = P(data, theta) / sum(P(data|theta)P(theta))


练习1：Red bike, Yellow bike
=============================
北京有1000辆mobike，3000辆ofo。

你有个同事，说真话的概率永远是90%。

有一天，你同事说“靠，今天被mobike撞了”。

他被mobike撞的概率是多少？

分析：

参数theta：被撞的车型

数据data：同事说被撞的车型

先验概率：被mobike撞了的概率应该和mobike的数量占比一致：P(theta=m)=1000/(1000+3000) = 0.25

似然函数：P(同事说被撞的车型|被撞的车型), P(data=m|theta=m) = 0.9, P(data=m|theta=o) = 1-P(data=o|theta=0) = 0.1

后验概率：P(theta=m|data=m) = P(data=m, theta=m)/P(data=m) 

= P(data=m,theta=m) / [P(data=m,theta=m) + P(data=m,theta=o)] **全概公式**

= P(data=m|theta=m)P(theta=m) / [P(data=m,theta=m) + P(data=m,theta=o)]  **条件概率**

= 0.9*0.25 / (0.9*0.25 + 0.1*0.75)

= 0.75 

< 0.9

# 变式1：稀有的小蓝

**思考1** 假设北京还有40辆小蓝车。你同事说他被小蓝撞了，你觉得后验概率是多少？

# 变式2：偏心的同事

**思考2** 假设你同事偏爱ofo。当他被ofo撞了，他只有20%的概率说真话；当他被mobike撞了，他有90%的概率说真话

这两个变式其实都是在说*信号噪音比*的问题

练习2: 三门问题
==============================
假设有三个门，其中一个门后面是奥迪，另外两个门后面是奥拓。

你选择任何一个门（假设是A），然后主持人从剩下两个门里选择一个门（假设是B），告诉你里面是奥拓。

你应该换到剩下的门里去么（假设是C）


思考题答案
==============================
1. (40/4040*0.9) / (40/4040*0.9+4000/4040*0.1) ~= 0.08
2. (0.25*0.9) / (0.25*0.9+0.75*0.8) ~= 0.27