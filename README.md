# Anime Searcher: Using Tableau, SQL and Python

## 1. Project objective

Ever had confusion in which anime to watch, trust me, I have been there, so I tried building this simulation using tableau, after cleaning data in SQL and python 
where you could search for an anime based on score received and genre.

## 2. Data description

The data for this project consists of information about anime its title,its duration date, and other stuffs, it has 19311 columns and 12 rows

![image](https://user-images.githubusercontent.com/86428423/187196569-cabd4e85-c75b-4149-8b12-64889b3c2888.png)

now we can see that there are non-numeric and spl charecters in the title, synopsis,aired and genre column, so this data cannot be uploaded to SQL server and we need to remove
the special characters

## 3. Data Cleaning

To do this we will upload the data in python an remove the special charcters using the code below

```
anime['aired']=anime['aired'].str.replace(r'\W',' ')
anime['title']=anime['title'].str.replace(r'\W',' ')
anime['synopsis']=anime['synopsis'].str.replace(r'\W',' ')
anime['genre']=anime['genre'].str.replace(r'\W',' ')
```

Now when we take a look at the data we see that the special characters are removed

![image](https://user-images.githubusercontent.com/86428423/187197841-c0fe8f92-60b2-49cc-a8d2-7c05d61d4436.png)

this output is later loaded into a excel sheet in .xlsx format, so that it can be uploaded into to SQL server.

once loaded into SQL server I used ``` string_split ``` function to make each row to have only one genre and used ```rank``` function to take only the first genre(one anime can have multiple genres)

```
SELECT DISTINCT value,uid, RANK() OVER(PARTITION BY uid ORDER BY value) AS position  
FROM dbo.Sheet1$
CROSS APPLY string_split(genre,' ')
WHERE value != ' '
```
Once this was done I used a case funtion to create a new category to see how popular the anime was using the ```case``` function

## 4. Tableau Dashboard

Finally data was visualized in [Tableau](https://public.tableau.com/app/profile/akshay1426/viz/form_sql/Dashboard1)

![image](https://user-images.githubusercontent.com/86428423/187690436-7e6942fc-18f9-43d6-a33e-536e3de37785.png)
