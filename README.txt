
# dakachatgpt_v2

## Getting Started

# Section 1. Connecting  to Firebase with Flutterfire CLI & Theme App

1. Run Empty
2. Install Package: provider:  shared_preferences:
3. Creating a theme
4. Selecting a theme
5. Saving the theme

## Section 2. Building the login and registration screens

6. Adding Bottom navigation bar
7. Login Packages and assets
8. Registration screen part 1
10. OTP screen UI
11. User information screen
12. Connecting to Firebase Done
13. Sign in user part 1

# <https://https://firebase.google.com/docs/auth/flutter/phone-auth?hl=fr/auth/flutter/phone-auth?hl=fr>

14.Sign in user part 2
15. Login user and SHA keys

## Section 3 : Building the OTP and user information screen.
16. OPT screen part 1
17. OPT screen part 2
18. User information screen part 1
19. User information screen part 2
20. User information screen part 3
21. User model class
## Section 4 : User Authentication and data Management
22. Setting up Firebase Authentication and Firestore for user data
23. Creating user model and updating user data
24. Handling user authentication and sign-up errors
25. Implementing sign-out functionality
26. Updating user data in Firestore upon profile changes
27. Retrieving user data from Firestore

## Section 5 : Chat Scrimplementationeen 
28. Designing and implementing the landing screen UI
29. Implementing chat screen UI with StreamBuilder and handling input messages
30. Implementing chat input field with the send button
31. Implementing a chat provider for sending and receiving messages
32. Implementing a chat stream to listen for incoming messages
33. Setting up API service for image generation with DALL-E
https://platform.openai.com/docs/api-reference/models/list 
34. Handling image generation errors and responses from DALL-E API
## Section 6 : ChatGPT and DALL-E Integration 
35. Parsing and displaying image response from DALL-E API
REQUEST : a tree in the desert
ANSWER : https://oaidalleapiprodscus.blob.core.windows.net/private/org-lLU7JmBZlLpE3ybnPDT5BBIM/user-rLHNf9jUzTrIsplvxxHqLC5B/img-395q9bOS1rf278OqxhE42HwI.png?st=2024-01-04T10%3A48%3A26Z&se=2024-01-04T12%3A48%3A26Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image/png&skoid=6aaadede-4fb3-4698-a8f6-684d7786b067&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2024-01-03T15%3A20%3A34Z&ske=2024-01-04T15%3A20%3A34Z&sks=b&skv=2021-08-06&sig=rp5hi0MQyI/V%2BvslfBZN/6lw9a2xL6Hv9qCFZy8giS8%3D
Cost :  on 04/01/2024 -> 0.04$

REQUEST : Ai in the cosmos.
ANSWER : https://oaidalleapiprodscus.blob.core.windows.net/private/org-lLU7JmBZlLpE3ybnPDT5BBIM/user-rLHNf9jUzTrIsplvxxHqLC5B/img-Kadi8dx9djI2AQuGppxjRQMb.png?st=2024-01-04T10%3A59%3A38Z&se=2024-01-04T12%3A59%3A38Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image/png&skoid=6aaadede-4fb3-4698-a8f6-684d7786b067&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2024-01-03T22%3A34%3A28Z&ske=2024-01-04T22%3A34%3A28Z&sks=b&skv=2021-08-06&sig=6oXeVUhw%2BYxXnrY8ouLVMjZvxs5kamzSGrbiBGz3H/Q%3D
Cost :  on 04/01/2024 -> 0.04$ 
REQUEST : Artificial intelligence in the cosmos
ANSWER : https://oaidalleapiprodscus.blob.core.windows.net/private/org-lLU7JmBZlLpE3ybnPDT5BBIM/user-rLHNf9jUzTrIsplvxxHqLC5B/img-jPWmx2XCKWEQKwlIhxU5zlPL.png?st=2024-01-04T11%3A07%3A55Z&se=2024-01-04T13%3A07%3A55Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image/png&skoid=6aaadede-4fb3-4698-a8f6-684d7786b067&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2024-01-03T21%3A12%3A30Z&ske=2024-01-04T21%3A12%3A30Z&sks=b&skv=2021-08-06&sig=2V2W4qvlvQLrriLhBwp/TNA759dIae2w1x10%2BAIQx2o%3D
Cost :  on 04/01/2024 -> 0.04$ 

36. Saving ChatGPT response to Firestore
REQUEST : who are you
ANSWER : I am an AI language model created by OpenAI. 
I am designed to assist with answering questions and engaging in conversations.
Cost :  on 04/01/2024 -> 0.01$ 

37. Implementing chat widget for ChatGPT and DALL-E
