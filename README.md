# WordGame
Project consist of two targets. One is the main application and the other is for unit tests. All the requirements have been implemented.
For running just build and run the application.
## Technologies 
### Combine
I use Combine to bind the viewController to the viewModel. Everything easily pass between two object with MVVM architecture
### UIKit
I use xib file to implement the UI. Also it can be implemented in Storyboard or SwfitUI. But I choose xib file as it's easy to use. If the UI is more complicated I would rather to use tableView and customized cells.
### Libraries
I use custom JSONLoader object so I can use it across the app for loading json files.
Also I implemented some extension to UIViewController for showing custom alerts that I can reuse anywhere in the app
## Architecture - MVVM
MVVM is my the best fit for this game. As we can seperate the responsibilities easily and implement the game's logic inside viewModel. 
I tried to use DI to achieve the most in Unit testing.
About the model I tried to be more general than using only spanish language so I name the properties more generic. 
I tried to use some sort of Coordinator and Facade pattern too. So I can seperate the navigation into other object and easily navigate to other screen. As we only have one screen. I just used it for showing alert.
