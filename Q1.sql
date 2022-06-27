
SELECT  channels.channel_id, channels.name AS channelName, 
COUNT(videos.channel_id) AS videosPerChannel, 
max(published) AS lastPublished,
case cast (COUNT(videos.channel_id)/12 as integer)
 when 0 then COUNT(videos.channel_id)
 else COUNT(videos.channel_id)/12 end as numOf_vidoes_published_on_avg
FROM    videos
         LEFT JOIN channels
		 ON videos.channel_id = channels.channel_id 
		 GROUP BY channels.channel_id;
