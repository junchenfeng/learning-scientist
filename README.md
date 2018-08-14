Learning Scientist
=====================

# I.基础知识

## a 事件、联合概率、条件概率
## b 贝叶斯定理
## c 随机变量及其分布
## d Optimization入门

# II.应用统计

## 1 假设检验
## 2 最小残差法和OLS
## 3 最大虽然估计和逻辑回归

# III.测评

## 4 Item Response Theory
## 5 Bayesian Knowledge Tracing

# IV.自适应算法

## 6 Knowledge Space
## 7 Computerized Adaptive Testing (TODO)

# V.学习科学概览

## 8 Affective Study (TODO)
## 9 Intelligent Tutor System (TODO)
## 10 Experience API(xAPI) (TODO)


# 软件

推荐使用Rstudio做为开发工具

## 可以使用CRAN安装的包

    readr
    dplyr
    lm
    car
    stargazer
    glm
    ltm
    kst
 

##需要单独安装的包

    bkt

先克隆IEMDS提供的源码

        git clone https://github.com/IEDMS/REDM.git

进入Rstudio以后

        install.packages(devtools)

在Rstudio中open package bkt

        build()
        install()
