#https://www.kaggle.com/buddhiniw/breast-cancer-prediction/data?select=data.csv
#data set explanation on kaggle

cancer_data$id<-NULL
cancer_data$X<-NULL

#create subset with only numerical variables
cancer_data_num<-cancer_data
cancer_data_num$diagnosis<-NULL

#standardization of data
#create dataset for normalized values

cancer_data_stand<-cancer_data_num

cancer_data_stand[,]<-lapply(cancer_data_stand[,],normalized)


#divide data into training & testing
set.seed(201)
index<-sample(nrow(cancer_data_stand),0.75*nrow(cancer_data_stand))

training_cancer<-cancer_data_stand[index,]
testing_cancer<-cancer_data_stand[-index,]

k=sqrt(nrow(cancer_data));k

#create dependent variable vector for training and testing data
ytrain<-cancer_data$diagnosis[index]
ytest<-cancer_data$diagnosis[-index]

pred_y_test_cancer<-knn(training_cancer,testing_cancer,k=23,cl=ytrain)

table(actual=ytest, predicted=pred_y_test_cancer)
acc_knn<- (88+49)/(88+49+5+1); acc_knn
sen_knn<- 49/(49+5); sen_knn
spe_knn<- 88/(88+1) ; spe_knn







