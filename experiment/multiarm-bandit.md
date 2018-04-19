# Multiarm-Bandit

## 伯努利分布的贝叶斯模型估计

X ~ Bernoulli(p)
p ~ Beta(a, b)
Posterior p | Y,N ~ beta(a+Y, b+N)

### 举例

### 练习

## Thompson Sampling

### Basics
Given two choices: X1 ~ Bernoulli(p1) and X2 ~ Bernoulli(p2)
p1 ~ P1 = Beta(a1, b1); p2 ~ P2 = Beta(a2, b2)

(1) Sampling
sample p1 and p2 from posterior P1 and P2
sample goes to argmax(p1,p2)

(2) Calibration
observe the result Yi
update posterior Pi given Yi

### 举例

### 练习
batch thompson

## Thompson Sampling as Statistical Test
最重要的决定如何停止
How google did it: 
draw N pair sample of (p1, p2). if P( p1/p2-1 > c) > d stops
if c = 0.05， d = 0.01；p1 比 p2高5%的概率超过99%

Worse type 1 error against frequentist
Better type 2 error against frequentist

### 举例

### 练习
