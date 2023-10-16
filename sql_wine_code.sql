use wine;
select * from `winequality-red`;
### This datasets are related to red variants of the Portuguese "Vinho Verde" wine.

## this dataset cotains total 11 columns of data
#1 - fixed acidity-->Fixed acidity in wine is a set of low volatility organic acids that are inherent to the characteristics of the sample.
#2 - volatile acidity-->is a measure of the volatile (or gaseous) acids in wine. The primary volatile acid in wine is acetic acid, which is also the primary acid associated with the smell and taste of vinegar.
#3 - citric acid--> In a grape, around 50-60% of the acid is tartaric, 30-40% is malic, and less than 10% is citric
#4 - residual sugar--> Residual Sugar (or RS) is from natural grape sugars leftover in a wine after the alcoholic fermentation finishes
#5 - chlorides--> In wines, the concentration of chloride ions is generally indicative of the presence of sodium chloride5. Sodium chloride adds to the saltiness of a wine
#6 - free sulfur dioxide-->it is an anti-microbial agent, and as such is used to help curtail the growth of undesirable fault producing yeasts and bacteria.
#7 - total sulfur dioxide--> In most wine-producing countries, the maximum levels of sulfur dioxide (SO2) in wine are: Red wine: 150 ppm White wine: 200 ppm
#8 - density-->generally between 1.080 and 1.090.
#9 - pH-->Even though the pH values of wine can range from 2.9-3.8, most winemakers prefer a range of 3.0-3.5.
#10 - sulphates--> Sulphites act as both a wine's preservative and enhancer
#11 - alcohol -->  wine alcohol content ranges between 9 percent and 14 percent ABV, unless it is fortified
#Output variable (based on sensory data):
#12 - quality (score between 0 and 10)---> this is based on their calculation they have given the quality rate

# Question1): Retrieve the first 5 rows of the dataset.
select * from `winequality-red`
limit 5;

#Question: Find the average alcohol content in the dataset.
select avg(alcohol) as avg_alcohol_content from `winequality-red`;

# the quality ranges from 0-10 so i want to retrive only >7 quality
# Question: in the dataset have a quality score greater than or equal to 7?
SELECT * FROM `winequality-red`
WHERE quality >= 7;

# i want the count of it
SELECT COUNT(*)
FROM `winequality-red`
WHERE quality >= 7;

# Question: Retrieve the wines with the highest quality score.
SELECT *
FROM `winequality-red`
WHERE quality = (SELECT MAX(quality) FROM `winequality-red`);

#Question: Calculate the average alcohol content for wines with a quality score of 5 or lower and for wines with a quality score of 6 or higher.

SELECT quality, AVG(alcohol) AS avg_alcohol
FROM `winequality-red`
GROUP BY quality
HAVING quality <= 5 OR quality >= 6;

#Question: Find the wine with the highest alcohol content and the wine with the lowest pH.
SELECT *
FROM `winequality-red`
WHERE alcohol = (SELECT MAX(alcohol) FROM `winequality-red`)
UNION
SELECT *
FROM `winequality-red`
WHERE pH = (SELECT MIN(pH) FROM `winequality-red`);

#Query: Retrieve the wines with a quality score of 7 or 8, and list them in descending order of alcohol content.
SELECT *
FROM `winequality-red`
WHERE quality IN (7, 8)
ORDER BY alcohol DESC;

# Query: Calculate the average residual sugar content for wines with a quality score of 5, 6, and 7.
select avg(`residual sugar`) 
from `winequality-red`
WHERE quality IN (5,6,7)
group by quality;

# Query: Find the wine with the highest total sulfur dioxide content and the wine with the lowest volatile acidity.
SELECT *
FROM `winequality-red`
WHERE `total sulfur dioxide` = (SELECT MAX(`total sulfur dioxide`) FROM `winequality-red`)
UNION
SELECT *
FROM `winequality-red`
WHERE `volatile acidity` = (SELECT MIN(`volatile acidity`) FROM `winequality-red`);


# Query: Retrieve the top 10 wines with the highest fixed acidity.
select * from `winequality-red`
order by `fixed acidity` desc
limit 10;

# Query: Find the wines with chlorides above 0.1 and volatile acidity above 0.5.
SELECT *
FROM `winequality-red`
WHERE chlorides > 0.1 AND `volatile acidity` > 0.5;

# Query: Calculate the count of wines for each unique quality score in the dataset.
SELECT quality, COUNT(*) AS count
FROM `winequality-red`
GROUP BY quality;

# Query: Retrieve wines with a quality score greater than 5 and a citric acid content of at least 0.3.
# at least means min
SELECT *
FROM `winequality-red`
WHERE quality > 5 AND `citric acid`>=  0.3;

# Query: Find the wines with a total sulfur dioxide content above 200 and a quality score of 7 or higher.
SELECT *
FROM `winequality-red`
where `total sulfur dioxide` > 200 and quality >=7;








