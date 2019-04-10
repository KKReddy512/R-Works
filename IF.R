
#random number
rm(answer) #removes amswer variable each time the code is run
x<-rnorm(1)
# if runs only once where as while runs many times
if(x>1){
  answer<-"Greater than 1"
}else if(x>=-1){
    answer<-"Between 1 and -1"
  }else{
    answer<-"Less than 1"
  }



