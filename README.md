# Project 2 - *Flicks*

**Flicks** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **8** hours spent in total

## User Stories

The following **required** functionality is complete:

- [x] User can view a list of movies currently playing in theaters from The Movie Database.
- [x] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [x] User sees a loading state while waiting for the movies API.
- [x] User can pull to refresh the movie list.

The following **optional** features are implemented:

- [ ] User sees an error message when there's a networking error.
- [ ] Movies are displayed using a CollectionView instead of a TableView.
- [ ] User can search for a movie.
- [ ] All images fade in as they are loading.
- [ ] User can view the large movie poster by tapping on a cell.
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete.
- [x] Customize the selection effect of the cell.
- [ ] Customize the navigation bar.
- [ ] Customize the UI.

The following **additional** features are implemented *(List anything else that you can get done to improve the app functionality!)*:

- [x] User sees app icon in home screen and styled launch screen
- [x] User sees custom app icon and launch screen made in Sketch3
- [x] User can scroll within the main view controller table view cell to read entire movie overview rather than just a preview 

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Code organization
2. Search methods

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/hlpostman/FlicksTA/blob/master/flicksTA.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- AlamofireImage - networking task library

## License

    Copyright 2017 H.L. Postman

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
# Project 2 - *Flicks*

**Flicks** is a movies app displaying box office and top rental DVDs using [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **6.5** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User can tap a cell to see a detail view (+5pts)
- [ ] User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView (+5pts)

The following **optional** features are implemented:

- [ ] User can tap a poster in the collection view to see a detail screen of that movie (+3pts)
- [ ] In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer (+3pts)
- [ ] Customize the navigation bar (+1pt)
- [ ] List in any optionals you didn't finish from last week (+1-3pts)
   - [ ] User can search for movies by title
   - [ ] All images fade in as they are loading.
   - [ ] User can view the large movie poster by tapping on a cell.
   - [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete.

The following **additional** features are implemented (list anything else that you can get done to improve the app functionality!):

- [ ] User can access a menu that shows movies that are now playing, top rated, or family (G, PG, and PG13 rated)
- [ ] User can change table view to show now playing, top rated, or family (G, PG, and PG13 rated) movies
- [ ] User can scroll through movie cast in order of appearance in movie detail view
- [ ] User can search for movies by cast member 
- [ ] User can view the large cast photo by tapping on a cell
- [ ] Zoomable photo view on movie poster

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Best way to organize code when a single view controller contains multiple collection views, given that the cellForItemAt method is not overload-able.  I used a switch statement on the collection view variables themselves.  I saw online that another approach is to keep the data source and delegate of each in separate files rather than using the active class for all of them - how would you do this?  And if you did, would you want to use unique reuse identifiers across the collection views?  What use cases are best satisfied by which method (switch on the collection view within the non-overload-able functions, vs separate files)?  Anybody have ideas about or experience with other ways to do this?
2.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

## License

    Copyright 2017 H.L. Postman

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
