# T1A3
## Links
Link to directory: https://github.com/Wokko-wok/QuocLam_T1A3

Link to kanban: https://trello.com/invite/b/nzj4b3Bo/c30db2f46605ccc6c4624c4650864c8c/quoclamt1a3


The following application is similar to an order management system as it allows a user to manage a list of orders obtained from a spreadsheet. The user will have the ability to see the name of a customer, the number of orders from said customer, and the current state of the order. All this information is within the csv spread sheet but within the app it is sorted by the orders status and the orders priority. This is done by reading the csv and sorting them into seperate arrays. The user is also allowed to change the current status of the order which goes from: pending, started, and dispatched. Before changing the status the application will ask for confirmation just incase it was a mistake. If they accept the application will then change the status. This is done by finding the selected customers order location within the original array then it will change the status. 

To use the application you will need the following in the same folder: the main application (app.rb), its methods (loading,rb), and a list of customer orders (order.csv). The csv can be opened with any spreadsheet editor and will show up as a table. Each rows information is ordered by the customers name, their number of orders, the current orders status, and if it has priority (True or False). To run the application the user will need to have ruby and run the following command in the folders terminal: "ruby app.rb". The user will then be prompted with a menu which can be navigated with arrow keys and the enter key.
