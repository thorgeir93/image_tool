"""
Google Photos uploader
======================

Created by ChatGPT.

might want to read:
* https://towardsdatascience.com/how-to-download-images-from-google-photos-using-python-and-photos-library-api-6f9c1e60a3f3
"""

from pydantic import BaseSettings

from googleapiclient.discovery import build
from googleapiclient.errors import HttpError
from google.oauth2.credentials import Credentials

# Set up the OAuth2 credentials
credentials = Credentials.from_authorized_user_info()

# Set up the API client and authenticate
service = build('photoslibrary', 'v1', credentials=credentials)

# Create a new album and get the album ID
album_metadata = {'album': {'title': 'My Album'}}
response = service.albums().create(body=album_metadata).execute()
album_id = response['id']

# Upload the images to the album
for image_path in image_paths:
  with open(image_path, 'rb') as image
