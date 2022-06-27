--  For each channel , how many videos have a description, 
--  what is the shortest description, the longest, average length of descriptions for each channel.

SELECT channel_id, COUNT(description) AS NumOf_videos, MAX(description) As largest__Desc, MIN(description) AS shortest_Desc, AVG(length(description)) AS AVG_length_Of_Description
FROM videos
WHERE description != ''

GROUP BY channel_id
ORDER BY COUNT(description) DESC;

