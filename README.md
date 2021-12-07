CodePath iOS Group 2 Project
===

# PlayDate

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
An app for setting up play-dates with fellow pet owners.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Social Networking
- **Mobile:** Mobile only experience, chat system, matchmaking system
- **Story:** Assembles a profile from user preferences and matches them with other pet profiles. Matched owners can then share contact imformation to set up pet play-dates.
- **Market:** Anyone can use this application. However, in fully take advantage of all features, the user must own a pet. 
- **Habit:** Swiping left and right to match with other pet profiles is a perfect way to keep users engaged throughout each and every day. Quite habit forming!
- **Scope:** This application takes inspiration from Tinder. In our case, we only have a few weeks to implement this project. Because of that constraint, we want to start with an Minimum Viable Product (MVP) with the minimal features (swiping, matching, contact info exchange) to complete this project. Otherwise, we will not be able to complete the scope within the time frame. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] User can create an account
- [x] User can login
- [x] Users can stay logged in between restarts
- [x] Users can upload pictures to their profile
- [x] Users can add their pet name, type, and age to their profile
- [x] Users can create a biography in their profile
- [x] Users can add external contact information to their profile to send to matches
- [x] Users can swipe left to reject a potential match
- [x] Users can swipe right to accept a potential match
- [x] Users can see contact information within their matches' profiles
- [ ] Complete back-end and front-end connection

**Optional Nice-to-have Stories**

- [ ] Users can see profiles within a certain area by using the GPS
- [ ] Chat system between matched users
- [ ] Favorite list of matches
- [ ] Notification System
- [ ] Owner can have multiple pets

### 2. Screen Archetypes

* Start Screen
    * Login 
    * Register
* Register Screen
   * email
   * password
* Log-in Screen
   * email
   * password
* Profile Set Up
   * Owner profile picture
   * Owner's name
   * Owner's age
   * Pet name
   * Pet type
   * Pet age
   * Pet Pictures
   * Contact information
* Home (Swiping) Screen
   * Potential Match profile Card
       * Can be swiped left or right on
       * Tap = pop-up view of profile
* Potential Profile Pop-up
   * Swipe through potential match photos
   * View basic profile information 
* User Profile
   * Same content inside Profile Set Up 
* Matched Profiles
   * TableView of Profile cells
       * Profile information
* Matched Profile Screen
   * Profile information

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
* Matched Profiles
* User Profile

**Flow Navigation** (Screen to Screen)

* If User not registered in
   * Start Screen -> Register Screen -> Profile Set Up -> Home
* If User logged in
   * -> Home
* If User not logged in
   * Start Screen -> Login Screen -> Home
* Matched Profiles
   * Matched Profiles tab -> Profile cell -> Profile Screen
* Home
   * Home -> Potential profile -> Potential Match pop-up

## Wireframes
![Wireframe 1](https://i.imgur.com/wJHCxOl.jpg)
![Wireframe 2](https://i.imgur.com/YSFzoMg.jpg)

### Digital Wireframes & Mockups


| Start | Register Screen | Login Screen |
| -------- | -------- | -------- |
| ![](https://i.imgur.com/07uCeYb.png) | ![](https://i.imgur.com/cbD3JDE.png) |![](https://i.imgur.com/MdGXokw.png)|  

| Profile Setup (Owner) | Profile Setup (Pet) |
| -------- | -------- |
| ![](https://i.imgur.com/HksUboo.png) | ![](https://i.imgur.com/WjwJkXn.png) |

## Schema 
### Models

**Owner Profile**
| Property | Type | Description |
| -------- | -------- | -------- |
| profileId | String  | unique id for the user profile |
| ownerProfilePicture | Image | picture of owner |
| ownerName | String | name of owner |
| ownerAge | Int | age of owner |
| pet | Pet | the owner's pet |

**Pet Profile**
| Property | Type | Description |
| -------- | -------- | -------- |
| profileId | String  | unique id for the pet profile |
| petProfilePicture | Image | single profile image of pet |
| petName | String | name of pet |
| petType | String | type of pet |
| petAge | Int | age of owner |
| petSex | String | sex of pet | 
| petBio | String[] | description of pet |
| petPictures | Image[] | List of pictures for pet |

### Networking
**List of network requests by screen**
- Register Screen
    - (create/POST) create profile oject: send email and password to database
- Login Screen
    - (Read/GET) read existing username 
    - (Read/GET) read existing password 
    - (Create/POST) create a new login session
- Profile Set Up Screen 
    - (Create/POST) Add user's name
    - (Create/POST) Add user's age
    - (Create/POST) Add user's birthdate
- Pet Set Up Screen
    - (Create/POST) Add pet's name
    - (Create/POST) Add pet's type
    - (Create/POST) Add pet's age
- Home Screen
    - (Read/GET) Query potential matches
    - (Create/POST) Create new like (swipe right) on potential match
    - (Create/POST) Create new dislike (swipe left) on potential match
- Matches Screen
    - (Read/GET) Query matched profiles
    - (Delete) Delete existing matched profile
- Owner Profile Screen
    - (Read/GET) Query owner profile information
    - (Update/PUT) Update owner profile image
- Pet Profile Screen
    - (Read/GET) Query pet profile information
    - (Update/PUT) Update pet profile image
    - (Update/PUT) Update pet name
    - (Update/PUT) Update pet type
    - (Update/PUT) Update pet age
    - (Update/PUT) Update pet sex
    - (Update/PUT) Update pet bio
    - (Update/PUT) Update pet pictures
