library(readr)
library(dplyr)
library(ggplot2)
exp_result = read_delim("/Users/fengjunchen/git/learning-scientist/data/exp_result.csv", delim='\t')

Q = data.frame(course_id=as.character(), q1=as.integer(), q2=as.integer())
for (group_name in unique(exp_result$course_id)){
  
  group_data = exp_result %>% filter(course_id==group_name)
  
  valid_users = group_data %>%
    group_by(student_id) %>%
    summarize(n=n()) %>%
    filter(n==2)
  item1 = group_data %>% 
    filter(posttest=='similar', student_id %in% valid_users$student_id) %>%
    dplyr::select(course_id, student_id, master) %>% rename(q1=master)
  item2 = exp_result %>% 
    filter(posttest=='transfer', student_id %in% valid_users$student_id) %>%
    dplyr::select(course_id, student_id, master) %>% rename(q2=master)
  q = merge(item1,item2) %>% dplyr::select (-student_id)
  Q = rbind(Q,q)
}


## IRT
library(ltm)

irt_data = Q %>% dplyr::select(-course_id)
m1 = rasch(irt_data, constraint = cbind(ncol(irt_data) + 1, 1))
m2 = rasch(irt_data)
m3 = tpm(irt_data, type = "rasch", max.guessing = 1)

par(mfrow = c(2, 2))
pl1 <- plot(m1)
text(2, 0.35, "Rasch model\nDiscrimination = 1")
pl2 <- plot(m2)
text(2, 0.35, "Rasch model")
pl3 <- plot(m3)
text(2, 0.35, "Rasch model\nwith Guessing parameter")

irt_param = data.frame(course_id=as.character(), item_id=as.character(), model=as.character(),alpha=as.numeric(), beta=as.numeric())
for (group_name in unique(exp_result$course_id)){
  group_data = Q %>%filter(course_id==group_name) %>% dplyr::select(-course_id)
  m1 = rasch(group_data, constraint = cbind(ncol(group_data) + 1, 1))
  m2 = rasch(group_data)
  irt_param = rbind(irt_param, data.frame(course_id=group_name, item_id='q1', model='RASCH', alpha=1, beta=m1$coefficients[1,1]))
  irt_param = rbind(irt_param, data.frame(course_id=group_name, item_id='q2', model='RASCH', alpha=1, beta=m1$coefficients[2,1]))
  irt_param = rbind(irt_param, data.frame(course_id=group_name, item_id='q1', model='2PL', alpha=m2$coefficients[1,2], beta=m2$coefficients[1,1]))
  irt_param = rbind(irt_param, data.frame(course_id=group_name, item_id='q2', model='2PL', alpha=m2$coefficients[2,2], beta=m2$coefficients[2,1]))
    }

print(irt_param)
## BKT
library(bkt)
# download the github repo, install devtools; open project, build(), install()
p0 = data.frame(init=0.5, learn=0.5, guess=0.25, slip=0.25)
bkt_param = data.frame(course_id=as.character(), init=as.numeric(), learn=as.numeric(), guess=as.numeric(), slip=as.numeric())
for (group_name in unique(exp_result$course_id)){
  group_data = Q %>%filter(course_id==group_name) %>% dplyr::select(-course_id)
  m = bkt.hmm.fit(p0, group_data)
  bkt_param = rbind(bkt_param, data.frame(course_id=group_name, init=m$init, learn=m$learn, guess=m$guess, slip=m$slip))
  }

irt_param %>% filter(model=='RASCH') %>% dplyr::select(course_id, item_id, beta)

all_param = merge(bkt_param %>% dplyr::select(course_id, learn), Q %>% group_by(course_id) %>% summarize(delta_p=mean(q2)-mean(q1)))
all_param = merge(all_param, irt_param %>% filter(model=='RASCH') %>% dplyr::select(course_id, item_id, beta) %>% spread(item_id, beta) %>% mutate(delta_beta=q2-q1) %>% dplyr::select(course_id, delta_beta))

all_param = all_param %>% arrange(desc(learn))
print(all_param)
