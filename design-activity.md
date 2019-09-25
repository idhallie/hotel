**What classes does each implementation include? Are the lists the same?**
Both implementations have the same classes: CartEntry, ShoppingCart, and Order. 

**Write down a sentence to describe each class.**
CartEntry: Contains the unit_price and quantity of the object and in Implementation B also calculates price.

ShoppingCart: Contains an array of entries and in Implementation B also calculates the sum of all of the entries in the array.

Order: Generates a new instance of ShoppingCart and contains a method to calculate the order total with sales tax.

**How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.**

**What data does each class store? How (if at all) does this differ between the two implementations?**
Both Implementations store the same data. 

Order stores @cart, which generates a new ShoppingCart instance. ShoppingCart holds an array of entry instances that must be populated with an unseen method. CartEntry holds @unit_price and @quantity.

**What methods does each class have? How (if at all) does this differ between the two implementations?**
Implementation A and B both have a total_price method in the Order class. Implementation B also has a price method in CartEntry and ShoppingCart. 

**Consider the Order#total_price method. In each implementation:**
**Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?**
**Does total_price directly manipulate the instance variables of other classes?**

In implementation A, CartEntry and ShoppingCart hold information, but do not possess any behavior. This makes the Order class dependent on these other classes because to calculate the total price in the Order class, the method must reference the instance variables of the other classes. As an example, if the names of the instance variables in CartEntry or ShoppingCart were ever changed or eliminated, it would break the total_price method in the Order class.

In Implementation B, each class has a method to calculate a price (or sub-total). Cart Entry calculates the price of a single item in its 'price' method, ShoppingCart iterates through all of the entries (an array of instances) and calls the entry.price method to access the information that CartEntry calculates. This produces a subtotal without tax applied. The Order class then accesses the subtotal of the cart using cart#price method. In this structure, so long as the method names of each class are preserved, the instance variable names and individual calculations could change without breaking the behavior in the Order class. 

**If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?**
If items are cheaper when bought in bulk, there would need to be logic incorporated to indicate "if quantity exceeds X amount, apply Y discount". This is easier to implement in B where the discount can be applied at the item level. 

Implementation A would have to assess whether each entry's quantity qualifies for the discount, if so, calculate one way, if not, calculate the other way and then add to sub-total. 

**Which implementation better adheres to the single responsibility principle?**
Implementation B better adheres to the single responsibility principle. It obtains calculations from the other classes without touching their instance variables.

**Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?**

Implementation B is more loosely coupled. In this Implementation, a total with sales tax can be returned for any object that has a 'price' method. Implementation A, must also have knowledge of each entry's 'unit_price' and 'quantity' which are instance methods and subject to change.

POST-REFACTOR QUESTIONS:
**How easy is it to follow your own instructions?**
I was able to understand my instructions, but with new knowledge, I don't agree with my hints at refactoring.

**Do these refactors improve the clarity of your code?**
I refactored to include a module namespace, a custom AvailabilityError for when there are date conflicts, and to better organize tests. I also eliminated keyword arguments on methods that only take a start_date and end_date. Although I did this based upon what I read in the Sandi Metz book, I tend to agree that it is too much for what I needed an only created extra noise. In that respect, I believe I've improved the clarity of my code. 

**Do you still agree with your previous assessment, or could your refactor be further improved?**
I didn't actually pursue my own refactoring advice. I thought that the way I implemented the find_available_rooms method in Hotel class may not have been executed properly, but then I learned that my method was actually a good way to do it. My other thought was that I could refactor make_block and make_reservation since some of the code is similar. Upon further inspection, I think a refactor would have come at the sacrifice of clarity and readability, so I kept it as-is.
