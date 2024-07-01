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
    api_url = f"https://XXXXX/smmm-media/instagram-bot/getPostInfo?postId={postId}&force=1"

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

def upload_to_firebase(local_file_path, firebase_storage_path):
    print(f"Uploading {local_file_path} to {firebase_storage_path}")
    # Replace this with your Firebase project's API key and storage path
    firebase_api_key = "XXXXX"
    filename = os.path.basename(local_file_path)

    firebase_storage_url = f"https://firebasestorage.googleapis.com/v0/b/XXXXX.appspot.com/o/{firebase_storage_path}%2F${filename}?uploadType=media&name={filename}&key={firebase_api_key}"

    with open(local_file_path, 'rb') as f:
        file_data = f.read()

    response = requests.post(firebase_storage_url, data=file_data)

    if response.status_code == 200:
        print(f"Uploaded {local_file_path} to Firebase Storage at {firebase_storage_path}")
    else:
        print(f"Failed to upload file. Status code: {response.text}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <instagram_url or file_path>")
    else:
        input_path = sys.argv[1]
        
        if input_path.startswith("http"):
            # It's an Instagram URL
            get_post_info(input_path)
        else:
            # It's a local file path
            upload_to_firebase(input_path, 'outputs')
