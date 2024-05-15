#自动检查谁没交作业-----
path <- 'C:/Users/86152/Desktop/大学课程/大三下/生态学综合实验/水稻重金属胁迫实验/20级实验报告'
setwd(path)
all.data <- list.files()
numberlist <- as.character(0:9)
to.exclude <- c(" ","",'.',"-","_",letters[1:26])
number <- c()
name <- c()
for (i in all.data){
  ele <- strsplit(i,"")
  name0 <- c()
  number0 <- c()
  for (j in ele[[1]]){
    if (j %in% numberlist )number0 <- c(number0,j)
    if ((!j %in% numberlist)&(!j %in% to.exclude))name0 <- c(name0,j)
  }
  name <- c(name,paste(name0,collapse=""))
  number <- c(number,paste(number0,collapse=""))
}
# 
# for (i in all.data){
#   ele <- strsplit(i,"")
#   
#   name0 <- c()
#   
#   number0 <- c()
#   for (j in ele[[1]]){
#     if (j %in% numberlist )number0 <- c(number0,j)
#     if ((!j %in% numberlist)&(!j %in% to.exclude))name0 <- c(name0,i)
#   }
#   name <- c(name,paste(name0,sep=""))
#   number <- c(number,paste(number0,collapse=""))
# }
#output----
student <- data.frame(name=name,number=number)
studentlist <- read.csv('C:\\Users\\86152\\Desktop\\学委工作\\ecostudent.csv')
##谁没交
setdiff(studentlist$name,student$name)
setdiff(studentlist$number,student$number)
