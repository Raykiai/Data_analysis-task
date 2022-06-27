-- for the top ten channels by number of videos this year, how many videos did they publish each month on average

-- SELECT channel_id, count(video_id) AS total_videos
-- from videos
-- WHERE strftime('%Y',published) == '2022'
-- group by channel_id
-- order by count(video_id) DESC
-- LIMIT 10;

SELECT channel_id,count(video_id) AS num_videos, 
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
  else 'December' end as Month
FROM videos
WHERE strftime('%Y',published) == '2022'
GROUP BY strftime('%m',published),channel_id
ORDER BY count(video_id) DESC
