#
# ver. 24.6.1
# Ref) https://klabosendai.wixsite.com/mysite/blank-13

driftS2 <- function(N,iFreq,Gen,Rep,s){

    Frequency01<-numeric(Gen+1)
    Frequency02<-numeric(Gen+1)
    Frequency03<-numeric(Gen+1)

    Num01<-numeric(Gen+1)
    Num02<-numeric(Gen+1)
    Num03<-numeric(Gen+1)

    Generation<-numeric(Gen)

    par(new=F)

    for(j in 1:Rep){

        Frequency01[1]<-iFreq  # Neutral
        Frequency02[1]<-iFreq  # Adaptive 
        Frequency03[1]<-iFreq  # Maladaptive

        for(i in 1:Gen){

            Generation[i]<-i
            # Adaptive
            if(i>1){
                if(Frequency02[i]+s > 1){
                    Frequency02[i] <- 1
                }else if(Frequency02[i]  == 0){ 
                    Frequency02[i] <- 0  # Modified at S2 (lost adaptive)
                }else{
                    Frequency02[i] <-Frequency02[i]+s
                }
                # Maladaptive
                if(Frequency03[i]-s < 0){
                    Frequency03[i] <- 0
                }else if(Frequency03[i]  == 1){
                    Frequency03[i] <- 1  # Modified at S2 (fixed maladaptive)
                }else{
                    Frequency03[i] <-Frequency03[i]-s
                }  
            }


            Num01[i]<-rbinom(1,N,Frequency01[i])    
            Num02[i]<-rbinom(1,N,Frequency02[i])    
            Num03[i]<-rbinom(1,N,Frequency03[i])    

            Frequency01[i+1]<-Num01[i]/N
            Frequency02[i+1]<-Num02[i]/N
            Frequency03[i+1]<-Num03[i]/N

        }

        Generation[i+1]<-i+1

        plot(Generation,Frequency01,ylim=c(0,1),xlim=c(1,Gen),type="l",col="red",lty=1, ylab="", cex.lab=2, cex.axis=2)
        par(new=T)
        plot(Generation,Frequency02,ylim=c(0,1),xlim=c(1,Gen),type="l",col="green",lty=1, ylab="", cex.lab=2, cex.axis=2)
        par(new=T)
        plot(Generation,Frequency03,ylim=c(0,1),xlim=c(1,Gen),type="l",col="blue",lty=1, ylab="", cex.lab=2, cex.axis=2)
        par(new=T)
    }

}
