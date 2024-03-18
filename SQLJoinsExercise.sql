/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
	SELECT products.Name, categories.Name
    FROM products
    INNER JOIN categories on categories.CategoryID = products.CategoryID
    WHERE categories.Name = 'Computers';
    
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
	SELECT products.Name, products.Price, reviews.Rating
    FROM products
    INNER JOIN reviews ON reviews.ProductID  = products.ProductID
    Where reviews.Rating = '5';
    
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
	SELECT employees.FirstName, employees.LastName, Sum(sales.Quantity) AS Total
    FROM sales
    INNER JOIN employees ON employees.EmployeeID = sales.EmployeeID
    GROUP BY employees.employeeID
    ORDER BY Total ASC;
    
/* joins: find the name of the department, and the name of the category for Appliances and Games */
	SELECT departments.Name, categories.Name
    FROM departments
    INNER JOIN categories ON categories.DepartmentID = departments.DepartmentID
    WHERE departments.Name = 'Appliances' OR categories.Name = 'Games';
    
/* joins: find the product name, total # sold, and total price sold,
	for Eagles: Hotel California --You may need to use SUM() */
	SELECT products.Name, Sum(sales.Quantity * sales.PricePerUnit) AS 'Total'
    FROM products
    INNER JOIN sales ON sales.ProductID = products.ProductID
    WHERE products.ProductID = '97';
   
	
    
    
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
	SELECT products.Name,  reviews.Reviewer, reviews.Rating, reviews.Comment
    FROM products
    INNER JOIN reviews ON products.ProductID = reviews.ProductID
    Where products.ProductID = '857' AND reviews.Rating = '1';
    

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
	SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, Sum(sales.Quantity) AS Total
    FROM sales
    INNER JOIN employees 
    ON employees.EmployeeID = sales.EmployeeID
    INNER JOIN products
    ON products.productID = sales.ProductID
    GROUP BY employees.employeeID, products.ProductID
    ORDER BY Total DESC;
    
	
