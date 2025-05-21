invlognorm<-function(xm=0, se=0){
  
  a=0
  b=0
  c=0
  
  a<-exp(xm+(se^2)/2)
  b<-((exp(se^2))-1)*exp((2*xm+se^2))
  
  c<-rlnorm(1,a,b)
}
c