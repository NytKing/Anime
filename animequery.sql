SELECT DISTINCT value AS genre,dbo.Sheet1$.uid,title,episodes,members,popularity,ranked,score,CASE WHEN popularity >= 10000 THEN 'Less popular' WHEN (popularity >= 5000 AND popularity < 10000) THEN 'okaishly popular' WHEN popularity < 5000 THEN 'Very popular' END AS category

FROM (SELECT DISTINCT value,uid, RANK() OVER(PARTITION BY uid ORDER BY value) AS position  
	  FROM dbo.Sheet1$
	  CROSS APPLY string_split(genre,' ')
	  WHERE value != ' ') AS new, dbo.Sheet1$ 

WHERE dbo.Sheet1$.uid = new.uid AND position = 1 --AND aired = 'Not available'
ORDER BY members 
