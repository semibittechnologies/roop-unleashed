import sys
import requests
import os

def get_post_info(url):
    # Extract postId from the URL
    if 'instagram.com/reels/' in url:
        postId = url.split('/reels/')[1].split('/')[0]
    elif 'instagram.com/p/' in url:
        postId = url.split('/p/')[1].split('/')[0]
    else:
        print("Invalid Instagram URL")
        return

    # API endpoint
    api_url = f"https://bots.in/ssssmmm-media/instagram-bot/getPostInfo?postId={postId}&force=1"
    print("make sure to upte the above url")

    # Making GET request
    response = requests.get(api_url)
    
    # Check if request was successful
    if response.status_code == 200:
        post_data = response.json()
        # Find the highest resolution video
        highest_resolution_url = None
        max_height = 0
        for video in post_data.get('video_versions', []):
            if video.get('height', 0) > max_height:
                max_height = video['height']
                highest_resolution_url = video['url']

        if highest_resolution_url:
            # Download the video
            filename = f"./inputs/{postId}.mp4"
            download_video(highest_resolution_url, filename)
            print(f"Downloaded highest resolution video to: {filename}")
        else:
            print("No video found in the response")
    else:
        print(f"Failed to fetch data. Status code: {response.status_code}")

def download_video(url, filename):
    with requests.get(url, stream=True) as r:
        r.raise_for_status()
        with open(filename, 'wb') as f:
            for chunk in r.iter_content(chunk_size=8192):
                f.write(chunk)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <instagram_url>")
    else:
        instagram_url = sys.argv[1]
        get_post_info(instagram_url)
