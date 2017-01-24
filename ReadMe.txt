This is a ecommerce webstore designed to help farmers to sell their products and consumers to 
buy the products. The application supports operation for three different types of users with 
roles as user for consumers, seller for product sellers and admin for those who manage members in the 
database. 

User can view product details and add/remove items in his cart and edit his/her profile.
Seller can view, add, remove and edit his/her products and can also edit his/her profile. 
Admin can view and delete the members. 
Credentials for users with different roles:
User: username: bunu password: bunu
Seller: username: 123 password: 123
Admin: username: admin, password: a
.........................................................................
"MUST READ FOR SECURITY CREDENTIALS"

THE ONLY AUTHORITY IS "user" "farmer" as the app is built with motive to sell a product of farmer

You can only create a member by clicking 	"register a new membership" but the default role is user for customer
if you are creating a new product seller, the role should be farmer

............................................................................

Steps to run..

This is a Spring Boot App
Run as SpringBootApp
Before Running

Please  create a schema "ecommercewebstore" in MySQl to run this application
and import the data to MySQl from import.sql to have prepopulated data

in case there is no self population while running the app or you can't access the log in, 
try to get the whole schema from src/main/resource folder with the name "import.sql"
populate the database "ecommercewebstore" with the help of "import.sql"
Once you have the database , you can run the application with above credentials

To create your own profile click register new membership

""

.........................Note this was just done in a night....
So please don't expect a full professional work, infact as I have used a basic template
It doesn't have facebook signIn( Dont click)
No User profile



Sorry for not meeting requirements

