CodePath iOS Group Project
===

# PlayDate

![PlayDate Icon](https://github.com/CodePath-iOS-PlayDate/PlayDate/blob/main/PlayDate/Assets.xcassets/AppIcon.appiconset/icon-76%402x.png)

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

* User can create an account
* User can login
* Users can stay logged in between restarts
* Users can upload pictures to their profile
* Users can add their pet name, type, and age to their profile
* Users can create a biography in their profile
* Users can add external contact information to their profile to send to matches
* Users can swipe left to reject a potential match
* Users can swipe right to accept a potential match
* Users can see contact information within their matches' profiles

**Optional Nice-to-have Stories**

* Users can see profiles within a certain area by using the GPS
* Chat system between matched users
* Favorite list of matches
* Notification System

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

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
