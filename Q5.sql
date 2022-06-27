-- For each channel in every month what is the difference between videos produced that month and the monthly average produced that month
-- and the monthly average produced that month
SELECT channel_id,
case cast (strftime('%m', published) as integer)
  when 01 then 'January'
  when 02 then 'February'
  when 03 then 'March'
  when 04 then 'April'
  when 05 then 'May'
  when 06 then 'June'
  when 07 then 'July'
  when 08 then 'August'
  when 09 then 'September'
  when 10 then 'October'
  when 11 then 'November'
  else 'December' end as Month, COUNT(video_id) AS Total
 , COUNT(video_id) - COUNT(videos.channel_id)/12 AS diff
FROM videos
GROUP BY channel_id, strftime('%m', published)

ORDER BY channel_id;