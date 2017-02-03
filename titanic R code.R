
#Titanic Data Set: Dealing with misssing values

library(dummies)

titanic_original <- read_excel("titalinc_original.xls")
titanic <- titanic_original
View(titanic)
str(titanic)

#Recoding NA's in 'Port of Embarkation' (character)

titanic$embarked[is.na(titanic$embarked)] <- "S"

#Recoding NA's in 'Age' (numeric)

titanic$age[is.na(titanic$age)] <- mean(titanic$age, na.rm = TRUE)

#Recoding missing 'Life Boat' data (character)

titanic$boat[is.na(titanic$boat)] <- "None"

titanic$has_cabin_number <- cbind(dummy(titanic$cabin))
titanic$has_cabin_number[!is.na(titanic$cabin)] <- "1"

titanic_clean <- titanic
write.csv(titanic_clean, "titanic_clean.csv")
