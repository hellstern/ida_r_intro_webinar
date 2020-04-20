<<<<<<< HEAD
# ***************************
=======
# *************************** 
>>>>>>> b37a8eeeb1ebe711593509e107466443728ce6b6
# Webinar
# IDA - 22-04-2020
# Tue Hellstern
# Jelgreen Consult
<<<<<<< HEAD
# ***************************

# ***************************
# Genveje
# ***************************

# Windows
# CTRL + Enter - Kør en R kommando
# Genvej for at indsætte "<-" - ALT + -
=======
# *************************** 

# ***************************
# Genveje
# *************************** 

# Windows
# CTRL + Enter - Kør en R kommando
# Genvej for at indsætte "<-" - ALT + - 
>>>>>>> b37a8eeeb1ebe711593509e107466443728ce6b6
# Genvej for at indsætte "%>%" - CTRL + SHIFT + M
# TAB - Mulige kommandoer
# CTRL + PIL OP - Afslutter din kommando

# MAC
# CMD + Enter - Kør en R kommando
<<<<<<< HEAD
# Genvej for at indsætte "<-" - Option + -
=======
# Genvej for at indsætte "<-" - Option + - 
>>>>>>> b37a8eeeb1ebe711593509e107466443728ce6b6
# Genvej for at indsætte "%>%" - CMD + SHIFT + M


# ***************************
# Grundlæggende syntaks
<<<<<<< HEAD
# ***************************
=======
# *************************** 
>>>>>>> b37a8eeeb1ebe711593509e107466443728ce6b6
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

# Fjern et objekt
rm(x)  # Her x

# Funktioner
length(y)     # Antallet af numre i vektoren
min(y)        # Minimumsværdien
max(y)        # Maksimumværdien
median(y)     # Medianen
sum(y)        # Summen
mean(y)       # Gennemsnittet
var(y)        # Variansen
sd(y)         # Standardafvigelsen


# Logiske operatorer
x
x == 2        # "==" betyder "lig med"
<<<<<<< HEAD
x == 3
=======
x == 3        
>>>>>>> b37a8eeeb1ebe711593509e107466443728ce6b6
x != 2        # "!=" betyder "ikke lig med"
x < 1         # "<" betyder "mindre end"
x > 1         # ">" betyder "større end"
x <= 2        # "<=" betyder "mindre eller lig med



# ***************************
<<<<<<< HEAD
# Hj�lp
# ***************************
help("mean") # Hjælp til en specifik funktion - mean
help("plot")

?mean
?plot

# Hj�lp�lp til en specifik pakke - base og tidyverse
=======
# Hjælp
# *************************** 
help("mean") # Hjælp til en specifik funktion - mean
help("plot")

?mean 
?plot

# Hjælp til en specifik pakke - base og tidyverse
>>>>>>> b37a8eeeb1ebe711593509e107466443728ce6b6
help(package = "base")
help(package = "tidyverse")



# ***************************
# Working Directory
<<<<<<< HEAD
# ***************************
=======
# *************************** 
>>>>>>> b37a8eeeb1ebe711593509e107466443728ce6b6
getwd()
setwd("C:/Users/Tue Hellstern/Documents/GitHub/r_webinar/r_kode/webinar_dag1")
# setwd("C:/Users/Tue Hellstern/Documents/GitHub")



# ***************************
# Pakker
<<<<<<< HEAD
# ***************************
=======
# *************************** 
>>>>>>> b37a8eeeb1ebe711593509e107466443728ce6b6
## WWW sider
browseURL("https://cran.r-project.org")

library()                     # Pakker der er på din computer
install.packages("ggplot2")   # install
library(dplyr)                # load

update.packages("tidyverse")  # Update
remove.packages("tidyverse")  # Fjern

browseURL("https://www.tidyverse.org")



# ***************************
<<<<<<< HEAD
# Indl�sning af Data
# ***************************
## CSV filer
? read.csv

# Working directory
getwd()
setwd("C:/Users/Tue Hellstern/Documents/GitHub/ida_r_intro_webinar/r_kode")

# sn.csv <- read.csv("C:\Users\tuhe\Desktop\bmi.csv", header = TRUE, sep = ";") # Virker IKKE
bmi <- read.csv("C:\\Users\\tuhe\\Desktop\\bmi.csv", header = TRUE, sep = ";")  # Virker
bmi <- read.csv("C:/Users/tuhe/Desktop/bmi.csv", header = TRUE, sep = ";")      # Virker
bmi <- read.csv2("C:/Users/tuhe/Desktop/bmi.csv", header = TRUE)                # Virker

bmi <- read.csv2("bmi.csv", header = TRUE)                                      # Virker, hvis CSV er i WD
str(bmi)

# ***************************
# Gem som CSV
# ***************************
?write.csv
write.csv2(bmi, file = "bmi_ny.csv")


# ***************************
## Excel filer
# ***************************
library(readxl)
help(package = "readxl")
browseURL("https://www.rdocumentation.org/packages/readxl/versions/1.3.1/topics/read_excel")


salg <- read_excel("webinar_data.xlsx")                          # Indl�ser f�rste ark
salg <- read_excel("webinar_data.xlsx", sheet = "salgs_data")    # Indl�ser arket salgs_data
salg <- read_excel("webinar_data.xlsx", sheet = 3)               # Indl�ser ark 3


# ***************************
# Standard - Plot
# ***************************
category <- table(salg$CategoryName)
str(category)
barplot(category[order(category, decreasing = T)])


# ***************************
# Plot ggplo2
# ***************************
?ggplot2
browseURL("https://ggplot2.tidyverse.org")

library(ggplot2)

# Group by Category + ggplot
salg %>%
  group_by(CategoryName) %>%
  summarise(totalsale=sum(Sale)) %>%
  ggplot() +
  geom_col(mapping = aes(x=CategoryName, y=totalsale)) +
  xlab("Categoryname") +
  ylab("Sale") +
  ggtitle("Sales by category",
          subtitle = "2016 to 2018")



# ***************************
# ggplo2 - Is salg
# ***************************

# Data / Is salg
issalg <- read_excel("webinar_data.xlsx", sheet = "is_salg")

# Plot
ggplot(data=issalg) +
  geom_point(mapping = aes(x=Temp, y=Salg_Total, size=Salg_Kugler)) +
  geom_point(mapping = aes(x=Temp, y=Salg_Total, size=Salg_Ispinde)) +
  geom_hline(yintercept = mean(issalg$Salg_Total))


ggplot(data=issalg, mapping = aes(x=Temp, y=Salg_Total)) +
  geom_point(size=Salg_Kugler) +
  geom_point(size=Salg_Ispinde) +
  geom_hline(yintercept = mean(issalg$Salg_Total))


ggplot(data = college) +
  geom_point(mapping = aes(x=tuition, y=sat_avg, color=control, size=undergrads), alpha=1/2) +
  annotate("text", label="Elite Privates", x=45000, y=1450) +
  geom_hline(yintercept = mean(college$sat_avg)) +
  annotate("text", label="Mean SAT", x=47000, y=mean(college$sat_avg)-15) +
  geom_vline(xintercept = mean(college$tuition)) +
  annotate("text", label="Main Tuition", y=1500, x=mean(college$tuition+3000)) +
  theme(panel.background = element_blank()) +
  theme(plot.background = element_blank()) +
  scale_color_discrete(name="Institution Type") +
  scale_size_continuous(name="Undergraduates") +
  scale_x_continuous(name="Tuition") +
  scale_y_continuous(name="SAT Score")

# Data / Is salg
issalg2 <- read_excel("webinar_data.xlsx", sheet = "issalg")

# Plot
ggplot(data=issalg2, mapping = aes(x=Temperatur, y=Salg, color=Butik_Placering, size=Salg)) +
  geom_smooth(se=FALSE) +
  geom_point(alpha=1/15) +
  geom_hline(yintercept = mean(issalg2$Salg)) +
  geom_vline(xintercept = mean(issalg2$Temperatur)) +
  theme(panel.background = element_blank()) +
  theme(plot.background = element_blank()) +
  scale_x_continuous(name="Temperatur") +
  scale_y_continuous(name="Total Salg") +
  scale_color_discrete(name="Placering af butiken") +
  scale_size_continuous(name="Salg")

ggplot(data=issalg2) +
  geom_point(mapping = aes(x=Temperatur, y=Salg, color=Butik_Placering, size=Salg)) +
  geom_hline(yintercept = mean(issalg2$Salg)) +
  geom_vline(xintercept = mean(issalg2$Temperatur)) +
  theme(panel.background = element_blank()) +
  theme(plot.background = element_blank()) +
  scale_x_continuous(name="Temperatur") +
  scale_y_continuous(name="Total Salg") +
  scale_color_discrete(name="Placering af butiken") +
  scale_size_continuous(name="Salg")




ggplot(data = college) +
  geom_point(mapping = aes(x=tuition, y=sat_avg, color=control, size=undergrads), alpha=1/2) +
  annotate("text", label="Elite Privates", x=45000, y=1450) +
  geom_hline(yintercept = mean(college$sat_avg)) +
  annotate("text", label="Mean SAT", x=47000, y=mean(college$sat_avg)-15) +
  geom_vline(xintercept = mean(college$tuition)) +
  annotate("text", label="Main Tuition", y=1500, x=mean(college$tuition+3000)) +
  theme(panel.background = element_blank()) +
  theme(plot.background = element_blank()) +
  scale_color_discrete(name="Institution Type") +
  scale_size_continuous(name="Undergraduates") +
  scale_x_continuous(name="Tuition") +
  scale_y_continuous(name="SAT Score")

# ***************************
# Save plots
# ***************************
?ggsave

ggsave("Sidste_plot.pdf")

=======
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
>>>>>>> b37a8eeeb1ebe711593509e107466443728ce6b6
