Mochammad Ezar Yudha
2206046746

<h1>Assignment 7</h1>

<h3>What are the main differences between stateless and stateful widget in Flutter?</h3>
Stateless widgets are immutable, meaning that the properties of the widgets are defined at the time of creation and do not change with time. Stateful widgets, on the other hand, contain properties that can change with time, meaning that they are primarily used for interactive elements such as animations or any other components that need to reflect the changes of its state. Stateless widgets are generally more efficient because the changes of the state do not need to be tracked.

<h3>Explain all widgets that you used in this assignment.</h3>
The homepage widget is the base of the application and contains the app's title and a scaffold for the rest of the application. The second widget is the card widget, which serves as a template for the 3 buttons in the application. The card widget contains information such as padding and alignment of the buttons, as well as an interactive component in the form of a snackbar. This snackbar is triggered when the user clicks on the button.

<h3>Explain how you implemented the checklist above step-by-step (not just following the tutorial).</h3>

Create a new Flutter application with the inventory theme, just like previous tutorials:

I first created the flutter project by running the appropriate command. This generated a template project which used stateful widgets. To meet the assignments requirements, I had to change the nature of the widgets from stateful to stateless. I then created a new dart file named "menu.dart" to create a more hierarchical structure for the project. The file contains the HomePage class which serves as the base of the application.

Create 3 simple buttons with icon and text:

I first created a Card class to create the stateless widget for the buttons. The class contains information such as padding and alignment of the buttons, this class will be called upon later in the HomePage class. I then created an Item class which contains the text and icon to be passed onto the buttons. Then, I created a list of the Item class and defined all of the buttons and their properties, i.e text and icon. This list was then used and iterated through in the base HomePage class. In each iteration, the Card class is called upon and the properties for each button defined in the Item list are passed. This creates the buttons.

Create an Snackbar:

I added a snippet of code into the Card class and created an event handler named "onTap" for when a button is clicked.

<h1>Assignment 8</h1>

<h3>Explain the difference between Navigator.push() and Navigator.pushReplacement(), accompanied by examples of the correct usage of both methods!</h3>

<h3>Explain each layout widget in Flutter and their respective usage contexts!</h3>

<h3>List the form input elements you used in this assignment and explain why you used these input elements</h3>

<h3>How is clean architecture implemented in a Flutter application?</h3>

<h3>Explain how you implemented the checklist above step-by-step! (not just following the tutorial)</h3>