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
Both of these methods are used to allow a user to navigate to a new page. They both utilize the stack feature to keep track of user's page history. The diffrences are in the way they push a new page to the top of the stack. With Navigator.push(), a new page is pushed on top of the stack, moving the previous page at the top of the stack downwards. Whereas with Navigator.pushReplacement(), a new page replaces the current top page in the stack, deleting it from the stack/page history.

An example of the use of Navigator.push() would be a case where you want to direct a user to a new page without deleting the previous page from their history. This makes it possible to have a feature that allows users to navigate to the previous page, such as a back button.

Navigator.pushReplacement() is used when you want to direct a user to a new page while also restricting the user's access to the previous page. For example, after a user logs in to a website, the method could be used to replace the login page in the stack with a homepage. This makes it so that the user won't be able to go back to the login page.

<h3>Explain each layout widget in Flutter and their respective usage contexts!</h3>
The layout widgets used in this project are the Container, Align, Padding, Column, ListView, and GridView.

Containers: Used to contain and decorate other widgets. They provide things such as padding, margin, and decoration.

Align: Aligns its child within the parent using a specified alignment.

Padding: Provides padding around a widget. Is used to create space between a parent widget and its child widget.

Column: Arranges children widgets in a vertical column.

ListView: Displays a scrollable list of widgets. Used for arranging objects in a list.

GridView: Displays a scrollable grid of widgets. Used for arranging objects in a two-dimensional grid.

<h3>List the form input elements you used in this assignment and explain why you used these input elements</h3>
I created 3 variables which store the values of the item's name, amount, and description. I then used TextFormField to allow the user to submit text as input which will be saved onto these variables.

<h3>How is clean architecture implemented in a Flutter application?</h3>
This can be done by seperating files of the same nature into their own seperate subdirectories. For example, we could bundle up all of the widgets files into a directory called 'widgets'.

<h3>Explain how you implemented the checklist above step-by-step! (not just following the tutorial)</h3>

Create at least one new page in the application, a page for adding a new item with the following requirements:

1. Use at least three input elements: name, amount, description. Add input elements according to the model in your Django assignment:

I first defined 3 variables in the itemlist_form.dart file. Then, inside of the build widget, I created a Form widget which wraps a column of TextFormField widgets. Each TextFormField widget corresponds to an input element from the model (name, amount, and description). The Form will automatically update the values initially defined in the beginning of the class with the values inputted by the user. The inputs are then validated to ensure that the inputs match the correct types.

2. Have a Save button:

I created a Save button at the bottom of the page. When pressed, it will check the state of the Form and try to validate the inputs given by the user. If the inputs are valid, then it will display a pop-up containing the saved values. At the end of its execution, the current state of the form will be reset and the user is free to input new values into the form.

3. Validate each input element in the form with the following requirements: Each input element must not be empty, Each input element must contain data of the same data type as its model attribute.

I created validators for each TextFormField widget to ensure the correct input types. The values will then be validated when the Save button is clicked.

4. Direct users to the new item addition form page when clicking the Add Item button on the main page:

I added Navigators to each card (button) in the main page using Navigator.pushReplacement(). The navigators will direct the user to a card's corresponding page.

5. Display data as entered in the form in a pop-up after clicking the Save button on the new item addition page:

I used AlertDialog to display the pop-up text. The AlertDialog contains 3 seperate text fields, each containing an an input element from the form and its corresponding value that was inputted by the user. When the user clicks OK, the pop-up will disappear. This was done by popping the pop-up from the page stack using Navigator.pop().

6. Create a drawer in the application with the following requirements: The drawer must have at least two options: Home and Add Item. When choosing the Home option, the application will direct the user to the main page.

I created a new file for the drawer named 'left_drawer.dart'. I created a Drawer widget with a listView to display its children in a scrollable manner. The top of the Drawer (DrawerHeader) contains two text fields to display some text. I then created ListTiles for each option (Home, Add Item, and View Items). Each ListTile comprises of Text and a navigator to direct the user to its corresponding page.

<h1>Assignment 9</h1>

<h3>Can we retrieve JSON data without creating a model first? If yes, is it better than creating a model before retrieving JSON data?</h3>
Yes, it is possible to retrieve JSON data without creating a model first. This approach involves creating Map<string,dynamic> structures and handling the raw data directly using those structures. This approach is advantageous for small, one off data. However, for larger sets of data, it is advised to use models, as they provide more maintainability and readibility.

<h3>Explain the function of CookieRequest and explain why a CookieRequest instance needs to be shared with all components in a Flutter application.</h3>
CookiesRequests, are requests sent to a server, specifically dealing with cookies. When communicating with a server, web applications often send and receive cookies as part of the HTTP headers. In some cases, multiple components within a Flutter application might need to make HTTP requests, and these requests may require cookie-related information. By sharing a CookieRequest instance across components, you ensure consistency in sending and handling cookies across different parts of the application.

<h3>Explain the mechanism of fetching data from JSON until it can be displayed on Flutter.</h3>
The first step is to fetch the data by sending HTTP requests to the server or API that responds with JSON data. Once the request is made, the server responds with JSON data. We can convert the JSON strings recieved from the server into dart objects by using the dart:convert library. The next part is optional but is essential for better handling and type safety, we can create dart model classes that represent the structure of the JSON data. The final step is to display the data using flutter widgets such as ListView.Builder(), GridView.builder(), etc.

<h3>Explain the authentication mechanism from entering account data on Flutter to Django authentication completion and the display of menus on Flutter.</h3>
In the flutter application, users can input their credentials such as username and password. These credentials are then sent to the django backend serveer. Django then handles the incoming authentication by verifying the user's credentials. If the credentials match, Django generates an authentication token or session for the authenticated user and sends a success response back to the Flutter app. If the credentials don't match, Django returns an authentication failure response.

<h3>List all the widgets you used in this assignment and explain their respective functions.</h3>
GridView: A scrollable grid with a default scroll direction, either vertical or horizontal, depending on the scrollDirection property.

InkWell: Used to create a rectangular area in the UI that responds to touch gestures, such as taps, long presses, and other interactions.

SizedBox: Used to control the size of its child widget or to add empty space within the layout.

<h3>Explain how you implement the checklist above step by step! (not just following the tutorial).</h3>

Create a login page in the Flutter project:
I created a file named login.dart where user input is collected and validated and sent to a server for authentication. The file also handles success or failure responses.

Integrate the Django authentication system with the Flutter project:
I defined a function named fetchItem() that performs an HTTP GET request to retrieve a list of items from my local URL, processes the response, and converts the JSON data into a list of Item objects. I was then able to display those objects in my items list. I used a similar approach to authenticate a user's credentials in the login feature. 

Create a custom model according to your Django application project:
I created a model in the lib/models directory named item.dart. The model consists of the following: name, date added, amount and description of the item. It also has the name of the user who created the item.

Create a page containing a list of all items available at the JSON endpoint in Django that you have deployed:
I created a file named list_item.dart that fetches a list of items from the server, displays them in a GridView, and navigates to an item details page when an item is tapped.

Create a detail page for each item listed on the Item list page:
I created a file named item_details.dart that can be accessed when an item is tapped in the list_item.dart. This screen displays the item's name, amount, and description.

