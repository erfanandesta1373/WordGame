# WordGame
Project consist of two targets. One is the main application and the other is for unit tests. All the requirements have been implemented.
For running just build and run the application.
I spend about 5-6 hours implementing the whole application from scratch. The most time-consuming part was to implement the game logic(viewModel) as it was more important than others like UI.
## Technologies 
### Combine
I use Combine to bind the viewController to the ViewModel. Everything easily passes between two objects with MVVM architecture
### UIKit
I use xib file to implement the UI. Also, it can be implemented in Storyboard or SwfitUI. But I choose xib file as it's easy to use. If the UI is more complicated I would rather use tableView and customized cells. Also if I have more time I would spend more time on the UI
### Libraries
I use a custom JSONLoader object so I can use it across the app for loading JSON files.
Also, I implemented some extensions to UIViewController for showing custom alerts that I can reuse anywhere in the app
## Architecture - MVVM
MVVM is the best fit for this game in comparison to MVC. As we can separate the responsibilities easily and implement the game's logic inside ViewModel. 
I tried to use DI to achieve the most in Unit testing.
About the model, I tried to be more general than using only the Spanish language so I name the properties more generic. 
I tried to use some sort of Coordinator and Facade pattern too. So I can separate the navigation into other objects and easily navigate to another screen. As we only have one screen. I just used it for showing alerts.
## Logic
I used Set instead of an array as the orders are not important in this game and also searching performance is better if we want to search through.
I didn't save any custom word pair in the app, as each decision(correct/wrong) is separate from the former and only game points are important.
If I had more time I would spend it on the UI, Unit test and also would like to mock the JSON loader and load mock data. Another thing that I like to improve is to add more protocol-oriented codes so can have more control over the layers. 
