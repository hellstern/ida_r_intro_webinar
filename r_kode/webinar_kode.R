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

# Hj?lp?lp til en specifik pakke - base og tidyverse
help(package = "base")
help(package = "tidyverse")



# ***************************
# Working Directory
# ***************************
getwd()
setwd("C:/Users/tuhe/Documents/GitHub/ida_r_intro_webinar/r_kode")
# setwd("C:/Users/Tue Hellstern/Documents/GitHub")
# "C:/Users/tuhe/Documents/GitHub/ida_r_intro_webinar/r_kode"
# "C:/Users/Tue Hellstern/Documents/GitHub/r_webinar/r_kode/webinar_dag1"


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

# Working directory
getwd()
setwd("C:/Users/tuhe/Documents/GitHub/ida_r_intro_webinar/r_kode")
# "C:/Users/tuhe/Documents/GitHub/ida_r_intro_webinar/r_kode"

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


salg <- read_excel("webinar_data.xlsx")                          # Indl?ser f?rste ark
salg <- read_excel("webinar_data.xlsx", sheet = "salgs_data")    # Indl?ser arket salgs_data
salg <- read_excel("webinar_data.xlsx", sheet = 3)               # Indl?ser ark 3


# ***************************
# Standard - Plot
# ***************************
category <- table(salg$CategoryName)
str(category)
barplot(category[order(category, decreasing = T)])


# ***************************
# ggplot2 - Is salg
# ***************************
?ggplot2
browseURL("https://ggplot2.tidyverse.org")
library(ggplot2)

# Data / Is salg
library(readxl)
getwd()
issalg <- read_excel("webinar_data.xlsx", sheet = "issalg")


# ******************************
# Plot ggplot2 - Is salg
# ******************************
ggplot(data=issalg) +
  geom_point(mapping = aes(x=Temperatur, y=Salg, color=Butik_Placering, size=Salg)) +
  geom_smooth(mapping = aes(x=Temperatur, y=Salg, color=Butik_Placering), se=FALSE) +
  geom_hline(yintercept = mean(issalg$Salg)) +
  annotate("text", label="Middel Salg", x=15, vjust = 0, y=mean(issalg$Salg+200)) +
  geom_vline(xintercept = mean(issalg$Temperatur)) +
  annotate("text", label="Middel Temperatur", y=100, hjust = 0, x=mean(issalg$Temperatur-0.5), angle = 90) +
  theme(panel.background = element_blank()) +
  theme(plot.background = element_blank()) +
  scale_x_continuous(name="Temperatur") +
  scale_y_continuous(name="Total Salg") +
  scale_color_discrete(name="Placering af butiken") +
  scale_size_continuous(name="Salg") +
  theme_classic()


# ******************************
# Plot ggplo2 - Salg - Group By
# ******************************
library(tidyverse)

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
# Save plots
# ***************************
?ggsave

ggsave("Sidste_plot.pdf")



# ***************************
# Shiny - Demo
# ***************************

# Pakken shiny
install.packages("shiny")
library(shiny)

# Shiny eksempler
runExample("01_hello")
runExample("02_text")
runExample("03_reactivity")
runExample("04_mpg")
runExample("05_sliders")
runExample("06_tabsets")
runExample("07_widgets")
runExample("08_html")
runExample("09_upload")
runExample("10_download")
runExample("11_timer")

