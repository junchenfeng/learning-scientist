Learning Scientist
=====================

# 内容单元

## I.基础知识

1.  事件、联合概率、条件概率([md课件](https://github.com/junchenfeng/learning-scientist/blob/master/basic/probability.md))
2.  贝叶斯定理([md课件](https://github.com/junchenfeng/learning-scientist/blob/master/basic/bayes.md))
3.  随机变量及其分布([md课件](https://github.com/junchenfeng/learning-scientist/blob/master/basic/distribution.md))
4.  Optimization入门([md课件](https://github.com/junchenfeng/learning-scientist/blob/master/basic/optimization.md))

## II.应用统计

1.  假设检验([md课件](https://github.com/junchenfeng/learning-scientist/blob/master/stat/hypothesis.md))
2.  最小残差法和OLS([rmd课件](https://github.com/junchenfeng/learning-scientist/blob/master/stat/ols/ols.Rmd))
3.  最大虽然估计和逻辑回归([rmd课件](https://github.com/junchenfeng/learning-scientist/blob/master/stat/logit/Logit.Rmd))

## III.测评

1.  Item Response Theory([rmd课件](https://github.com/junchenfeng/learning-scientist/tree/master/assessment/irt))
2.  Bayesian Knowledge Tracing([复习课件](https://github.com/junchenfeng/learning-scientist/blob/master/assessment/bkt/preview.md))([rmd课件](https://github.com/junchenfeng/learning-scientist/blob/master/assessment/bkt/BKT.Rmd))

## IV.自适应算法

1.  Knowledge Space([预习课件](https://github.com/junchenfeng/learning-scientist/blob/master/adaptive/knowledge_space/preview.md))([rmd课件](https://github.com/junchenfeng/learning-scientist/blob/master/adaptive/knowledge_space/Ks/Ks.Rmd))
2.  Computerized Adaptive Testing (TODO)

## V.学习科学概览

1.  Affective Study (TODO)
2.  Intelligent Tutor System (TODO)
3.  Experience API(xAPI) (TODO)

# 学习路径

## 假设检验
I.1 -> I.3 -> II.1 -> II.2

## IRT

I.1 -> I.3 -> I.4 -> II.3 -> III.1

## BKT
I.1 -> I.2 -> I.3 -> III.2

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
