# *************************** 
# Webinar
# IDA - 22-04-2020
# Tue Hellstern
# Jelgreen Consult
# *************************** 

# ***************************
# Genveje
# *************************** 

# Windows
# CTRL + Enter - Kør en R kommando
# Genvej for at indsætte "<-" - ALT + - 
# Genvej for at indsætte "%>%" - CTRL + SHIFT + M
# TAB - Mulige kommandoer
# CTRL + PIL OP - Afslutter din kommando

# MAC
# CMD + Enter - Kør en R kommando
# Genvej for at indsætte "<-" - Option + - 
# Genvej for at indsætte "%>%" - CMD + SHIFT + M


# ***************************
# Grundlæggende syntaks
# *************************** 
2 + 2  # Beregn
1:100 # printer 1 til 100
print("Hej med dig")

x <- 2  # Tildel x værdien 2
x * 2
x * x
x + x
x       # Viser værdien af x

y <- c(6, 7, 8, 9, 10) # Gemmer 6 til 10 i variablen y
# c() står for concatenate eller combine - Giver en vektor
y  # Viser y


x + y   # x lagt sammen med y
y
x * 2  # Ganger alle elementer i x med 2 - LOOP uden at være et LOOP ?

ls()   # Vis / List alle objekter

# Funktioner
length(y)     # Antallet af numre i vektoren
min(y)        # Minimumsværdien
max(y)        # Maksimumværdien
median(y)     # Medianen
sum(y)        # Summen
mean(y)       # Gennemsnittet
var(y)        # Variansen
sd(y)         # Standardafvigelsen


# Fjern et objekt
rm(x)  # Her x


# Logiske operatorer
x
x == 2        # "==" betyder "lig med"
x == 3        
x != 2        # "!=" betyder "ikke lig med"
x < 1         # "<" betyder "mindre end"
x > 1         # ">" betyder "større end"
x <= 2        # "<=" betyder "mindre eller lig med



# ***************************
# Hjælp
# *************************** 
help("mean") # Hjælp til en specifik funktion - mean
help("plot")

?mean 
?plot

# Hjælp til en specifik pakke - base og tidyverse
help(package = "base")
help(package = "tidyverse")



# ***************************
# Working Directory
# *************************** 
getwd()
setwd("C:/Users/Tue Hellstern/Documents/GitHub/r_webinar/r_kode/webinar_dag1")
# setwd("C:/Users/Tue Hellstern/Documents/GitHub")



# ***************************
# Pakker
# *************************** 
## WWW sider
browseURL("https://cran.r-project.org")

library()                     # Pakker der er på din computer
install.packages("ggplot2")   # install
library(dplyr)                # load

update.packages("tidyverse")  # Update
remove.packages("tidyverse")  # Fjern

browseURL("https://www.tidyverse.org")



# ***************************
# Indlæsning af Data
# *************************** 

## CSV filer 
? read.csv

# sn.csv <- read.csv("C:\Users\tuhe\Desktop\social_network.csv", header = TRUE, sep = ";")      # Virker IKKE 
sn.csv <- read.csv("C:\\Users\\tuhe\\Desktop\\social_network.csv", header = TRUE, sep = ";")  # Virker
sn.csv <- read.csv("C:/Users/tuhe/Desktop/social_network.csv", header = TRUE, sep = ";")      # Virker

sn.csv <- read.csv("social_network.csv", header = TRUE, sep = ";")                            # Virker, hvis CSV er i WD
str(sn.csv)

## Gem som CSV
write_csv(sn.csv, file = "social_network_2.csv")
? write.csv

write.table(sn.csv, file = "social_network_2.csv", sep = ";")
? write.table


## Excel filer
library(readxl)
? read_excel

sn.excel <- read_excel("college.xlsx")
str(sn.excel)




# ***************************
# Plot in base R
# *************************** 
?plot

plot(x = mtcars$disp, y = mtcars$mpg)

# Akse - Tekster
disp_data <- mtcars$disp
mpg_data <- mtcars$mpg
plot(x = disp_data, y = mpg_data)


plot(mtcars[, 1:4])

# Plot - sociale_network.csv
sn.csv <- read.csv("social_network.csv", header = TRUE, sep = ";")
str(sn.csv)

site.freq <- table(sn.csv$Site)  # Opret tabel ud fra Site
str(site.freq)
barplot(site.freq)

barplot(site.freq[order(site.freq, decreasing = T)])      # Sortering efter order
barplot(site.freq[order(site.freq)], horiz = T)           # Horizontally

# Facebook - Blå
FacebookColor <- c(rep("red", 5), rgb(59, 89, 152, maxColorValue = 255))  # Farve "skama"
barplot(site.freq[order(site.freq)], horiz = TRUE, col = FacebookColor)

# Viridis farve skema
browseURL("https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html")
install.packages("viridis")  # Install
library("viridis")           # Load


# Barplot med Viridis farve skema
barplot(site.freq[order(site.freq)], horiz = TRUE, col=viridis(7))

barplot(site.freq[order(site.freq)],
        horiz = TRUE,                                                       # Horizontal
        col = viridis(7),                                                   # Farver
        border = NA,                                                        # Ingen kanter
        xlim = c(0, 100),  # Scale 0-100
        main = "Preferred Social Networking Site\nA Survey of 202 Users",
        xlab = "Number of Users")

# HISTOGRAMS
hist(sn.csv$Age) # Ny Data Frame

hist(sn.csv$Age,
     col = viridis(7),
     main = "Ages of Respondents\nSocial Networking Survey of 202 Users",
     xlab = "Age of Respondents",
     ylim = c(0, 70))  # Scale 0-70)

#BOX PLOTS
boxplot(sn.csv$Age)

boxplot(sn.csv$Age,
        col = "beige",
        notch = T,
        horizontal = T,
        main = "Ages of Respondents\nSocial Networking Survey of 202 Users",
        xlab = "Age of Respondents")

# Sammelig 2 stk Boxplots Female/Male
box_male <- subset(sn.csv, Gender=="male")
box_female <- subset(sn.csv, Gender=="female")

boxplot(box_female$Age, box_male$Age,
        main = "Femal vs Male",
        names = c("Female", "Male"),
        col = viridis(2),
        horizontal = TRUE,
        notch = TRUE,
        xlab = "Age of Respondents")


# ***************************
# Links
# *************************** 

browseURL("https://www.r-project.org/about.html")
browseURL("https://www.rdocumentation.org")
browseURL("https://rweekly.org")
browseURL("https://ropensci.org/packages")
browseURL("https://www.r-graph-gallery.com/index.html")
browseURL("https://www.tidyverse.org")
browseURL("http://www.sthda.com/english/wiki/colors-in-r")
browseURL("http://www.r-graph-gallery.com/42-colors-names/")
browseURL("https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html")
