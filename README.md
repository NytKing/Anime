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

