import requests

def get_weather(location):
    url = f'https://wttr.in/{location}?format=%C\n%t\n'
    response = requests.get(url)
    return response.text.strip()

def main():
    location = "Debert"  # Set the location here
    while True:
        weather = get_weather(location)
        print(weather)
        user_input = input(" ")
        if user_input.lower() == 'q':
            break

if __name__ == '__main__':
    main()

