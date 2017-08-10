# Grocery Store

Let's simulate a grocery store system! We want to be able to keep track of the orders that folks make, both online and physically in our grocery store.

This project will allow you to explore object-oriented design as well as a few other new topics.

## Baseline Setup

1. This is an individual, stage 1 project.
1. Fork the project master.
1. Clone the forked repo: `$ git clone [YOUR FORKED REPO URL]`
1. `cd` into the dir create:d `$ cd BankAccounts`
1. Run `git remote -v` to verify the folder you are in corresponds to the fork you have created.
1. Run `gem install minitest-skip` to install an extra gem for testing (more on what this actually does later).

### Testing

This is our first project with real tests! Following the instructions from the [TDD lecture](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/00-programming-fundamentals/intro-to-automated-tests.md), there are three things in our project directory:

```
Rakefile
lib/
specs/
```

Each class you write (there will only be one until wave 3) should get its own file, `lib/class_name.rb`. The specs for that class will be in `specs/class_name_spec.rb`, and you can run all specs using `rake`.

For wave 1, all tests will be given to you - your job is to write code to make them pass. For waves 2 and 3, we supply descriptions of the tests, but you have to write them yourself.

## Wave 1

### Learning Goals
- Create a **class** inside of a **module**
- Create **methods** inside the **class** to perform actions
- Learn how Ruby does error handling
- Verify code correctness by **testing**

### Requirements

Create a `Grocery` module which will contain your `Order` class and any future grocery store logic.

Create an `Order` class which should have the following functionality:
- A new order should be created with:
  - an ID
  - a collection of products and their cost
    - allow no products to start
- A `total` method which will calculate the total cost of the order
  - sum up the products
  - add a 7.5% tax
- An `add_product` method which will take in two parameters, product name and price, and add the data to the product collection
- Access to the ID at any time

#### Error handling
- Ensure the `total` method returns an appropriate value when no products have been added yet

### Optional:
Make sure to write tests for any optionals you implement!

- A `remove_product` method on the `Order` class which will take in one parameter, a product name, and remove the product from the collection

- Create an `Product` class which will store the information about each product.
  - Attributes like ID, price and quantity

- Update the `Order` class to utilize objects from the `Product` class instead of the collection that is currently used

## Wave 2

### Learning Goals
- Create and use class methods
- Use a CSV file for loading data
- Create your own tests to verify method correctness.

### Requirements
- Update the `Order` class to be able to handle all of these fields from the CSV file used as input.
  - For example, manually choose the data from the first line of the CSV file and ensure you can create a new instance of your Order using that data
- Add the following **class** methods to your existing `Order` class
  - `self.all` - returns a collection of `Order` instances, representing all of the Orders described in the CSV. See below for the CSV file specifications.
  - `self.find(id)` - returns an instance of `Order` where the value of the id field in the CSV matches the passed parameter.

#### Error Handling
- what should your program do if `Order.find` is called with an ID that doesn't exist?

#### CSV Data File

The data, in order in the CSV, consists of:  

| Field    | Type     | Description
|----------|----------|------------
| ID       | Integer  | A unique identifier for that Order
| Products  | String  | The list of products in the following format: `name:price;nextname:nextprice`

### Optional:
First, implement the optional requirement from Wave 1

Then, add the following **class** methods to your existing `Product` class
  - `self.all` - returns a collection of `Product` instances, representing all of the Products described in the CSV. See below for the CSV file specifications
  - `self.find(id)` - returns an instance of `Product` where the value of the id field in the CSV matches the passed parameter

#### CSV Data File
The data, in order in the CSV, consists of:

| Field          | Type    | Description
|----------------|---------|------------
| ID             | Integer | A unique identifier for that Product
| Price      | Float  | The product's price
| Quantity     | Integer  | The product's quantity

To create the relationship between the orders and the products use the `order_products` CSV file. The data for this file, in order in the CSV, consists of:

| Field      | Type    | Description
|------------|---------|------------
| Order ID | Integer | A unique identifier corresponding to an Order
| Product ID   | Integer | A unique identifier corresponding to an Product

This type of table, where records from other tables are associated with each other, is often called a _join table_. We'll talk about them as a class in a few weeks.

## Wave 3
### Learning Goals
- Use inheritance to share some behavior across classes
- Enhance functionality built in Wave 1
- Add tests for all new classes and inherited functionality

### Requirements

For wave 3, you will create two new classes: `Customer` and `OnlineOrder`.

 The `OnlineOrder` class will inherit behavior from the `Order` class and include additional information to track customers and order status. You will create the `Customer` class which will be used _within_ the `OnlineOrder` class.

Each class should get its own file under the `lib/` directory, and each already has a spec file with stub tests.

#### Customer
Create a `Customer` class within the `Grocery` module.

Each new Customer should include the following attributes:
- email address
- delivery address information


#### OnlineOrder
Create an `OnlineOrder` class which will inherit behavior from the `Order` class.

Each new OnlineOrder should include the following attributes:
- A customer object
- A fulfillment status
  - pending, paid, processing, shipped or complete

It should include the following updated functionality:
- The `total` method should be the same, except it will add a $10 shipping fee
- The `add_product` method should be updated to permit a new product to be added if the status is either pending or paid
  - Otherwise, it should throw an `ArgumentError` (Google this!)
