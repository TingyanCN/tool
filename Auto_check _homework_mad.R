#### Automatically check ####
#### if there are someone don't hand in homework and formate the filename ####
#### TYG 2020 ####
#### 1 load reference ####
## 1.1 if you already have a list of your students's name and student id ## 
## format col1:name col2:number
studentlist <- read.csv('D:\\Desktop\\学委工作\\ecostudent.csv')

## 1.2 if you have been already formated some file in the past but don't have a list ##
## maybe as this format:王十-20001011
path <- 'D:/大学课程/大四上/劳动教育课作业/'
outputfold <- ''
all.data <- list.files(path=path)
numberlist <- as.character(0:9)
to.exclude <- c(" ","",'.',"-","_","+","(",")",letters[1:26])
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
student <- data.frame(name=name,number=number)
write.csv(student,file.path(outputfold,'ecostudent.csv'))

#### 2 read in homework filename and formate it ####
inputfold <- 'D:/大学课程/大四上/劳动教育课作业'
setwd(inputfold)
all.data <- list.files()
standard <- data.frame(file.original=all.data,name.standard=NA,number.standard=NA)
for(i in 1:nrow(standard)){
  for(j in 1:nrow(studentlist)){
    if(grepl(studentlist$name[j],standard$file.original[i]))standard$name.standard[i] <- studentlist$name[j]
  }
}
standard$number.standard <- studentlist$number[match(standard$name.standard,studentlist$name)]
setdiff(studentlist$name,standard$name)
setdiff(studentlist$number,standard$number)
for (i in 1:nrow(standard)){
  standard.filename <- paste(standard$number.standard[i],'-',standard$name.standard[i],'.docx',sep="")
  file.rename(standard$file.original[i],standard.filename)
}
