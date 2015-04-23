#load library#


library(dplyr)


#Read tables#
labels<-read.table("features.txt")
subject_test<-read.table("subject_test.txt")
subject_train<-read.table("subject_train.txt")
x_test<-read.table("X_test.txt")
y_test<-read.table("y_test.txt")
x_train<-read.table("X_train.txt")
y_train<-read.table("y_train.txt")
activity_label<-read.table("activity_labels.txt",stringsAsFactors=FALSE)

#combine tables#
test<-cbind(subject_test,x_test,y_test)
train<-cbind(subject_train,x_train,y_train)
step1_data<-rbind(test,train)
colnames(activity_label)<-c("code","activity")
#asign column names#
colnames(step1_data)<-c("subject",as.character(labels[,2]),"outcome")

df<-data.frame(step1_data)
step2_data<-cbind(step1_data$subject, step1_data$outcome,df[,grep("mean()\\b|std()\\b",names(df))])
colnames(step2_data)[1]<-"subject_code"
colnames(step2_data)[2]<-"activity_code"
#add activity description#
df<-merge(step2_data,activity_label,by.x="activity_code",by.y="code")
#change the labels
label<-data.frame(gsub("tBody","time_Body_",names(df)))
label2<-data.frame(gsub("fBody","frequency_Body_",label[,1]))
label3<-data.frame(gsub("Acc","_axial_",label2[,1]))
colnames(df)<-label3[,1]

#calcuate final tidy data

final<- df%>% group_by(activity,subject_code) %>% summarise_each(funs(mean))

write.table(final, file = "q1_data.txt", row.names = FALSE)
