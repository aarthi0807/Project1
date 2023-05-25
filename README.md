# youtube_data_harvesting-and-warehousing using MongoDB, MySQL and Streamlit
This streamlit app will get the youtube channel ID from the user and get channel details, playlist details, video details and comment details from Youtube API V3 and then transform the data into a dictionary and load into MongoDB for further steps. <br/>
We can select which channel details we need to migrate from MongoDB to MYSQL in a Drop down with dynamic values. <br/>
Once migrated we can do some Queries from MySQL DB
## Youtube API to MongoDB
1.Enter API Key which is created from Google developer console to connect with the Youtube API V3 <br/>
2.Enter Youtube Channel ID to get the details <br/>
3.Once Search button is clicked, the script will fetch the details from Youtube API and store the details in a dictionary. <br/>
4.The data will be displayed in json format in Streamlit App <br/>
5.We can load the data into MongoDB as a single document in a collection
6.Once loaded, a success message will be displayed
## MongoDB to MYSQL DB
1.In the second tab, a drop down will be displayed with the channel names whatever available in the MongoDB<br/>
2.We can select a channel and migrate it to MySQL<br/>
3.Once migrated, a success message will be displayed
## SQL Query
1.In the third tab, a drop down will be displayed with set of questions related to the data in the MySQL tables(channel_details,playlist_details,video_details,comment_details).<br/>
2.Any one of the question is selected and "Go" button is clicked, result will be displayed in table format in streamlit App
