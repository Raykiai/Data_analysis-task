-- for each category, which is the most popular day in a week to publish

SELECT category,  
case cast (strftime('%w', published) as integer)
  when 0 then 'Sunday'
  when 1 then 'Monday'
  when 2 then 'Tuesday'
  when 3 then 'Wednesday'
  when 4 then 'Thursday'
  when 5 then 'Friday'
  else 'Saturday' end as PopularDay , 
  
  COUNT(published) AS `value_occurrence` 


FROM videos
	LEFT JOIN channels
	ON videos.channel_id= channels.channel_id

GROUP BY channels.category

ORDER BY 
  `value_occurrence` DESC;