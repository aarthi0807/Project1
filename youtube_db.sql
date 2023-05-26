create database youtube_db;
use youtube_db;
create table channel_details(
	channel_id VARCHAR(50) PRIMARY KEY,
	channel_name VARCHAR(100),
    description VARCHAR(2000),
	video_count int,
	subscriber_count int
);
create table playlist_details(
	playlist_id VARCHAR(50) PRIMARY KEY,
    channel_id VARCHAR(50),
    playlist_title VARCHAR(100),
    FOREIGN KEY (channel_id) references channel_details(channel_id)
);
create table video_details(
	video_id VARCHAR(15) PRIMARY KEY,
    title VARCHAR(300),
    description VARCHAR(5000),
    published_at VARCHAR(25),
    view_count int,
    like_count int,
    favorite_count int,
    comment_count int,
    thumbnail_url VARCHAR(100),
    duration VARCHAR(20),
    caption_status VARCHAR(10),
    playlist_id VARCHAR(50),
    FOREIGN KEY (playlist_id) REFERENCES playlist_details(playlist_id)
);
create table comment_details(
	comment_id VARCHAR(30) PRIMARY KEY,
    comment_text VARCHAR(2000),
    author_name VARCHAR(50),
    comment_published_at VARCHAR(25),
    video_id VARCHAR(15),
    FOREIGN KEY (video_id) REFERENCES video_details(video_id)
);

ALTER TABLE comment_Details RENAME COLUMN comment_published_at TO published_at;

select * from channel_details;
select * from playlist_details;
select * from video_details;
select * from comment_details;

delete from channel_details where channel_id IN( 'UC4S0l76Nc5bRohfKq9MQ3pA' , 'UCA_e86cmqGCBqvesSAxlwsQ');

select c.channel_name,v.title 
	FROM channel_details as c
    JOIN playlist_details as p
    JOIN video_details as v 
    ON v.playlist_id = p.playlist_id and p.channel_id = c.channel_id;

SELECT channel_name,video_count FROM channel_details ORDER BY video_count DESC;

SELECT channel_name,v.title,view_count FROM channel_details as c JOIN playlist_details as p JOIN video_details as v ON v.playlist_id = p.playlist_id and p.channel_id = c.channel_id ORDER BY view_count DESC LIMIT 10;

SELECT title,comment_count from video_details ORDER BY comment_count DESC;

SELECT c.channel_name, v.title, v.like_count FROM channel_details as c JOIN playlist_details as p JOIN video_details as v ON v.playlist_id = p.playlist_id and p.channel_id = c.channel_id ORDER BY like_count DESC;

SELECT title,like_count from video_details ORDER BY like_count DESC;

SELECT c.channel_name,sum(v.view_count) as total_views FROM channel_details as c JOIN playlist_details as p JOIN video_details as v ON v.playlist_id = p.playlist_id and p.channel_id = c.channel_id GROUP BY channel_name ORDER BY sum(view_count) DESC;

SELECT * from video_details where published_at LIKE '2022%';

SELECT c.channel_name, COUNT(video_id) as no_of_videos_published_in_2022 FROM video_details as v JOIN channel_details as c JOIN playlist_details as p ON v.playlist_id = p.playlist_id and p.channel_id = c.channel_id WHERE v.published_at LIKE '2022%' GROUP BY c.channel_name;

SELECT channel_name, duration FROM channel_details as c JOIN playlist_details as p JOIN video_details as v ON v.playlist_id = p.playlist_id and p.channel_id = c.channel_id;

SELECT c.channel_name, v.title, v.comment_count FROM channel_details as c JOIN playlist_details as p JOIN video_details as v ON v.playlist_id = p.playlist_id and p.channel_id = c.channel_id ORDER BY comment_count DESC;