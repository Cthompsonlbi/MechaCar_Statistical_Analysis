library(dplyr)


#Deliverable 1
#reads in dataset
MechaCar <- read.csv(file="../Resources/MechaCar_mpg.csv",check.names=F,stringsAsFactors = F)

#creates linear model to passing all variables(columns)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance +AWD,data = MechaCar) #create linear model

#Summarize linear model of mpg relationship between other variables
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance +AWD,data = MechaCar))

#Deliverable 2

#reads in DataSet
SuspensionCoil_Table <- read.csv(file="../Resources/Suspension_Coil.csv",check.names=F,stringsAsFactors = F)

#Summarizes PSI Suspension for Mean, Median, SD, and variance
summarize_suspension <- SuspensionCoil_Table%>% summarize(Mean=mean(PSI), Median=median(PSI),Variance=var(PSI), SD = sd(PSI), .groups = 'keep')

#Create a summary table that groups the manufacturing lots my mean, median, variance and st.dev on PSI coil
Lot_Summary <- SuspensionCoil_Table%>% group_by(Manufacturing_Lot)%>%summarize(Mean=mean(PSI), Median=median(PSI),Variance=var(PSI), SD = sd(PSI), .groups = 'keep')

#Run a t.test on the SuspensionCoil_Table to see if the PSI is statistically different from population mean of 1500psi
t.test(log10(SuspensionCoil_Table$PSI),mu=1500)

#Run a t.test on the subset lots of the SuspensionCoil_Table to see if the PSI is statistically different from population mean of 1500psi
t.test(subset(SuspensionCoil_Table,Manufacturing_Lot =="Lot1")$PSI,mu=1500)

#Run a t.test on the subset lots of the SuspensionCoil_Table to see if the PSI is statistically different from population mean of 1500psi
t.test(subset(SuspensionCoil_Table,Manufacturing_Lot =="Lot2")$PSI,mu=1500)

#Run a t.test on the subset lots of the SuspensionCoil_Table to see if the PSI is statistically different from population mean of 1500psi
t.test(subset(SuspensionCoil_Table,Manufacturing_Lot =="Lot3")$PSI,mu=1500)