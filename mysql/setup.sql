-- Create database --
CREATE DATABASE sql_tutorial;

-- Switch database --
USE sql_tutorial;

-- Create Tables --

---- Categories ----
\! echo "Creating Categories tables...";
\! echo "";
CREATE TABLE Categories(
  ID int NOT NULL,
  Name varchar(255),
  Description varchar(255),
  PRIMARY KEY (ID)
);
\! echo "";
\! echo "Done creating Categories tables🎉";
\! echo "";

---- Customers ----
\! echo "Inserting records into Customers tables...";
\! echo "";
CREATE TABLE Customers(
  ID int NOT NULL,
  FullName varchar(255),
  ContactName varchar(255),
  Address varchar(255),
  City varchar(255),
  ZipCode varchar(255),
  Country varchar(255),
  PRIMARY KEY (ID)
);
\! echo "";
\! echo "Done creating Customers tables🎉";
\! echo "";

---- Employees ----
\! echo "Creating Employees tables...";
\! echo "";
CREATE TABLE Employees(
  ID int NOT NULL,
  LastName varchar(255),
  FirstName varchar(255),
  BirthDate date,
  Photo varchar(255),
  Notes longtext,
  PRIMARY KEY (ID)
);
\! echo "";
\! echo "Done creating Employees tables🎉";
\! echo "";

---- Shippers ----
\! echo "Creating Shippers tables...";
\! echo "";
CREATE TABLE Shippers(
  ID int NOT NULL,
  Name varchar(255),
  Phone varchar(255),
  PRIMARY KEY (ID)
);
\! echo "";
\! echo "Done creating Shippers tables🎉";
\! echo "";

---- Suppliers ----
\! echo "Creating Suppliers tables...";
\! echo "";
CREATE TABLE Suppliers(
  ID int NOT NULL,
  Name varchar(255),
  ContactName varchar(255),
  Address varchar(255),
  City varchar(255),
  ZipCode varchar(255),
  Country varchar(255),
  Phone varchar(255),
  PRIMARY KEY (ID)
);
\! echo "";
\! echo "Done creating Suppliers tables🎉";
\! echo "";

---- Products ----
\! echo "Creating Products tables...";
\! echo "";
CREATE TABLE Products(
  ID int NOT NULL,
  Name varchar(255),
  Unit varchar(255),
  Price float(5),
  CategoryID int,
  SupplierID int,
  PRIMARY KEY (ID),
  FOREIGN KEY (CategoryID) REFERENCES Categories(ID),
  FOREIGN KEY (SupplierID) REFERENCES Suppliers(ID)
);
\! echo "";
\! echo "Done creating Products tables🎉";
\! echo "";

---- Orders ----
\! echo "Creating Orders tables...";
\! echo "";
CREATE TABLE Orders(
  ID int NOT NULL,
  OrderDate date,
  CustomerID int,
  EmployeeID int,
  ShipperID int,
  PRIMARY KEY (ID),
  FOREIGN KEY (CustomerID) REFERENCES Customers(ID),
  FOREIGN KEY (EmployeeID) REFERENCES Employees(ID),
  FOREIGN KEY (ShipperID) REFERENCES Shippers(ID)
);
\! echo "";
\! echo "Done creating Orders tables🎉";
\! echo "";

---- OrderDetails ----"
\! echo "Creating OrderDetails tables...";
\! echo "";
CREATE TABLE OrderDetails(
  ID int,
  Quantity int,
  OrderID int,
  ProductID int,
  PRIMARY KEY (ID),
  FOREIGN KEY (OrderID) REFERENCES Orders(ID),
  FOREIGN KEY (ProductID) REFERENCES Products(ID)
);
\! echo "";
\! echo "Done creating OrderDetails tables🎉";
\! echo "";

-- Insert Records --

---- Categories ----
\! echo "Inserting records into Categories tables...";
INSERT
  INTO Categories (ID, Name, Description)
  VALUES (1, "Beverages", "Soft drinks, coffees, teas, beers, and ales");
INSERT
  INTO Categories (ID, Name, Description)
  VALUES (2, "Condiments", "Sweet and savory sauces, relishes, spreads, and seasonings");
INSERT
  INTO Categories (ID, Name, Description)
  VALUES (3, "Confections", "Desserts, candies, and sweet breads");
INSERT
  INTO Categories (ID, Name, Description)
  VALUES (4, "Dairy Products", "Cheeses");
INSERT
  INTO Categories (ID, Name, Description)
  VALUES (5, "Grains/Cereals", "Breads, crackers, pasta, and cereal");
INSERT
  INTO Categories (ID, Name, Description)
  VALUES (6, "Meat/Poultry", "Prepared meats");
INSERT
  INTO Categories (ID, Name, Description)
  VALUES (7, "Produce", "Dried fruit and bean curd");
INSERT
  INTO Categories (ID, Name, Description)
  VALUES (8, "Seafood", "Seaweed and fish");
\! echo "";
\! echo "Done inserting records into Categories tables🎉";
\! echo "";

---- Customers ----
\! echo "Inserting records into Customers tables...";
\! echo "";
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (1, "Alfreds Futterkiste", "Maria Anders", "Obere Str. 57", "Berlin", "12209", "Germany");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (2, "Ana Trujillo Emparedados y helados", "Ana Trujillo", "Avda. de la Constitución 2222", "México D.F.", "05021", "Mexico");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (3, "Antonio Moreno Taquería", "Antonio Moreno", "Mataderos 2312", "México D.F.", "05023", "Mexico");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (4, "Around the Horn", "Thomas Hardy", "120 Hanover Sq.", "London", "WA1 1DP", "UK");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (5, "Berglunds snabbköp", "Christina Berglund", "Berguvsvägen 8", "Luleå", "S-958 22", "Sweden");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (6, "Blauer See Delikatessen", "Hanna Moos", "Forsterstr. 57", "Mannheim", "68306", "Germany");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (7, "Blondel père et fils", "Frédérique Citeaux", "24, place Kléber", "Strasbourg", "67000", "France");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (8, "Bólido Comidas preparadas", "Martín Sommer", "C/ Araquil, 67", "Madrid", "28023", "Spain");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (9, "Bon app'", "Laurence Lebihans", "12, rue des Bouchers", "Marseille", "13008", "France");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (10, "Bottom-Dollar Marketse", "Elizabeth Lincoln", "23 Tsawassen Blvd.", "Tsawassen", "T2F 8M4", "Canada");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (11, "B's Beverages", "Victoria Ashworth", "Fauntleroy Circus", "London", "EC2 5NT", "UK");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (12, "Cactus Comidas para llevar", "Patricio Simpson", "Cerrito 333", "Buenos Aires", "1010", "Argentina");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (13, "Centro comercial Moctezuma", "Francisco Chang", "Sierras de Granada 9993", "México D.F.", "05022", "Mexico");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (14, "Chop-suey Chinese", "Yang Wang", "Hauptstr. 29", "Bern", "3012", "Switzerland");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (15, "Comércio Mineiro", "Pedro Afonso", "Av. dos Lusíadas, 23", "São Paulo", "05432-043", "Brazil");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (16, "Consolidated Holdings", "Elizabeth Brown", "Berkeley Gardens 12 Brewery", "London", "WX1 6LT", "UK");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (17, "Drachenblut Delikatessend", "Sven Ottlieb", "Walserweg 21", "Aachen", "52066", "Germany");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (18, "Du monde entier", "Janine Labrune", "67, rue des Cinquante Otages", "Nantes", "44000", "France");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (19, "Eastern Connection", "Ann Devon", "35 King George", "London", "WX3 6FW", "UK");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (20, "Ernst Handel", "Roland Mendel", "Kirchgasse 6", "Graz", "8010", "Austria");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (21, "Familia Arquibaldo", "Aria Cruz", "Rua Orós, 92", "São Paulo", "05442-030", "Brazil");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (22, "FISSA Fabrica Inter. Salchichas S.A.", "Diego Roel", "C/ Moralzarzal, 86", "Madrid", "28034", "Spain");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (23, "Folies gourmandes", "Martine Rancé", "184, chaussée de Tournai", "Lille", "59000", "France");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (24, "Folk och fä HB", "Maria Larsson", "Åkergatan 24", "Bräcke", "S-844 67", "Sweden");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (25, "Frankenversand", "Peter Franken", "Berliner Platz 43", "München", "80805", "Germany");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (26, "France restauration", "Carine Schmitt", "54, rue Royale", "Nantes", "44000", "France");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (27, "Franchi S.p.A.", "Paolo Accorti", "Via Monte Bianco 34", "Torino", "10100", "Italy");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (28, "Furia Bacalhau e Frutos do Mar", "Lino Rodriguez", "Jardim das rosas n. 32", "Lisboa", "1675", "Portugal");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (29, "Galería del gastrónomo", "Eduardo Saavedra", "Rambla de Cataluña, 23", "Barcelona", "08022", "Spain");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (30, "Godos Cocina Típica", "José Pedro Freyre", "C/ Romero, 33", "Sevilla", "41101", "Spain");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (31, "Gourmet Lanchonetes", "André Fonseca", "Av. Brasil, 442", "Campinas", "04876-786", "Brazil");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (32, "Great Lakes Food Market", "Howard Snyder", "2732 Baker Blvd.", "Eugene", "97403", "USA");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (33, "GROSELLA-Restaurante", "Manuel Pereira", "5ª Ave. Los Palos Grandes", "Caracas", "1081", "Venezuela");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (34, "Hanari Carnes", "Mario Pontes", "Rua do Paço, 67", "Rio de Janeiro", "05454-876", "Brazil");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (35, "HILARIÓN-Abastos", "Carlos Hernández", "Carrera 22 con Ave. Carlos Soublette #8-35", "San Cristóbal", "5022", "Venezuela");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (36, "Hungry Coyote Import Store", "Yoshi Latimer", "City Center Plaza 516 Main St.", "Elgin", "97827", "USA");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (37, "Hungry Owl All-Night Grocers", "Patricia McKenna", "8 Johnstown Road", "Cork", "", "Ireland");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (38, "Island Trading", "Helen Bennett", "Garden House Crowther Way", "Cowes", "PO31 7PJ", "UK");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (39, "Königlich Essen", "Philip Cramer", "Maubelstr. 90", "Brandenburg", "14776", "Germany");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (40, "La corne d'abondance", "Daniel Tonini", "67, avenue de l'Europe", "Versailles", "78000", "France");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (41, "La maison d'Asie", "Annette Roulet", "1 rue Alsace-Lorraine", "Toulouse", "31000", "France");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (42, "Laughing Bacchus Wine Cellars", "Yoshi Tannamuri", "1900 Oak St.", "Vancouver", "V3F 2K1", "Canada");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (43, "Lazy K Kountry Store", "John Steel", "12 Orchestra Terrace", "Walla Walla", "99362", "USA");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (44, "Lehmanns Marktstand", "Renate Messner", "Magazinweg 7", "Frankfurt a.M.", "60528", "Germany");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (45, "Let's Stop N Shop", "Jaime Yorres", "87 Polk St. Suite 5", "San Francisco", "94117", "USA");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (46, "LILA-Supermercado", "Carlos González", "Carrera 52 con Ave. Bolívar #65-98 Llano Largo", "Barquisimeto", "3508", "Venezuela");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (47, "LINO-Delicateses", "Felipe Izquierdo", "Ave. 5 de Mayo Porlamar", "I. de Margarita", "4980", "Venezuela");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (48, "Lonesome Pine Restaurant", "Fran Wilson", "89 Chiaroscuro Rd.", "Portland", "97219", "USA");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (49, "Magazzini Alimentari Riuniti", "Giovanni Rovelli", "Via Ludovico il Moro 22", "Bergamo", "24100", "Italy");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (50, "Maison Dewey", "Catherine Dewey", "Rue Joseph-Bens 532", "Bruxelles", "B-1180", "Belgium");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (51, "Mère Paillarde", "Jean Fresnière", "43 rue St. Laurent", "Montréal", "H1J 1C3", "Canada");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (52, "Morgenstern Gesundkost", "Alexander Feuer", "Heerstr. 22", "Leipzig", "04179", "Germany");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (53, "North/South", "Simon Crowther", "South House 300 Queensbridge", "London", "SW7 1RZ", "UK");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (54, "Océano Atlántico Ltda.", "Yvonne Moncada", "Ing. Gustavo Moncada 8585 Piso 20-A", "Buenos Aires", "1010", "Argentina");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (55, "Old World Delicatessen", "Rene Phillips", "2743 Bering St.", "Anchorage", "99508", "USA");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (56, "Ottilies Käseladen", "Henriette Pfalzheim", "Mehrheimerstr. 369", "Köln", "50739", "Germany");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (57, "Paris spécialités", "Marie Bertrand", "265, boulevard Charonne", "Paris", "75012", "France");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (58, "Pericles Comidas clásicas", "Guillermo Fernández", "Calle Dr. Jorge Cash 321", "México D.F.", "05033", "Mexico");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (59, "Piccolo und mehr", "Georg Pipps", "Geislweg 14", "Salzburg", "5020", "Austria");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (60, "Princesa Isabel Vinhoss", "Isabel de Castro", "Estrada da saúde n. 58", "Lisboa", "1756", "Portugal");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (61, "Que Delícia", "Bernardo Batista", "Rua da Panificadora, 12", "Rio de Janeiro", "02389-673", "Brazil");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (62, "Queen Cozinha", "Lúcia Carvalho", "Alameda dos Canàrios, 891", "São Paulo", "05487-020", "Brazil");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (63, "QUICK-Stop", "Horst Kloss", "Taucherstraße 10", "Cunewalde", "01307", "Germany");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (64, "Rancho grande", "Sergio Gutiérrez", "Av. del Libertador 900", "Buenos Aires", "1010", "Argentina");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (65, "Rattlesnake Canyon Grocery", "Paula Wilson", "2817 Milton Dr.", "Albuquerque", "87110", "USA");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (66, "Reggiani Caseifici", "Maurizio Moroni", "Strada Provinciale 124", "Reggio Emilia", "42100", "Italy");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (67, "Ricardo Adocicados", "Janete Limeira", "Av. Copacabana, 267", "Rio de Janeiro", "02389-890", "Brazil");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (68, "Richter Supermarkt", "Michael Holz", "Grenzacherweg 237", "Genève", "1203", "Switzerland");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (69, "Romero y tomillo", "Alejandra Camino", "Gran Vía, 1", "Madrid", "28001", "Spain");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (70, "Santé Gourmet", "Jonas Bergulfsen", "Erling Skakkes gate 78", "Stavern", "4110", "Norway");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (71, "Save-a-lot Markets", "Jose Pavarotti", "187 Suffolk Ln.", "Boise", "83720", "USA");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (72, "Seven Seas Imports", "Hari Kumar", "90 Wadhurst Rd.", "London", "OX15 4NB", "UK");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (73, "Simons bistro", "Jytte Petersen", "Vinbæltet 34", "København", "1734", "Denmark");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (74, "Spécialités du monde", "Dominique Perrier", "25, rue Lauriston", "Paris", "75016", "France");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (75, "Split Rail Beer & Ale", "Art Braunschweiger", "P.O. Box 555", "Lander", "82520", "USA");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (76, "Suprêmes délices", "Pascale Cartrain", "Boulevard Tirou, 255", "Charleroi", "B-6000", "Belgium");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (77, "The Big Cheese", "Liz Nixon", "89 Jefferson Way Suite 2", "Portland", "97201", "USA");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (78, "The Cracker Box", "Liu Wong", "55 Grizzly Peak Rd.", "Butte", "59801", "USA");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (79, "Toms Spezialitäten", "Karin Josephs", "Luisenstr. 48", "Münster", "44087", "Germany");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (80, "Tortuga Restaurante", "Miguel Angel Paolino", "Avda. Azteca 123", "México D.F.", "05033", "Mexico");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (81, "Tradição Hipermercados", "Anabela Domingues", "Av. Inês de Castro, 414", "São Paulo", "05634-030", "Brazil");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (82, "Trail's Head Gourmet Provisioners", "Helvetius Nagy", "722 DaVinci Blvd.", "Kirkland", "98034", "USA");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (83, "Vaffeljernet", "Palle Ibsen", "Smagsløget 45", "Århus", "8200", "Denmark");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (84, "Victuailles en stock", "Mary Saveley", "2, rue du Commerce", "Lyon", "69004", "France");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (85, "Vins et alcools Chevalier", "Paul Henriot", "59 rue de l'Abbaye", "Reims", "51100", "France");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (86, "Die Wandernde Kuh", "Rita Müller", "Adenauerallee 900", "Stuttgart", "70563", "Germany");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (87, "Wartian Herkku", "Pirkko Koskitalo", "Torikatu 38", "Oulu", "90110", "Finland");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (88, "Wellington Importadora", "Paula Parente", "Rua do Mercado, 12", "Resende", "08737-363", "Brazil");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (89, "White Clover Markets", "Karl Jablonski", "305 - 14th Ave. S. Suite 3B", "Seattle", "98128", "USA");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (90, "Wilman Kala", "Matti Karttunen", "Keskuskatu 45", "Helsinki", "21240", "Finland");
INSERT
  INTO Customers (ID, FullName, ContactName, Address, City, ZipCode, Country)
  VALUES (91, "Wolski", "Zbyszek", "ul. Filtrowa 68", "Walla", "01-012", "Poland");
\! echo "";
\! echo "Done inserting records into Customers tables🎉";
\! echo "";

---- Employees ----
\! echo "Inserting records into Employees tables...";
\! echo "";
INSERT
  INTO Employees (ID, LastName, FirstName, BirthDate, Photo, Notes)
  VALUES (1, "Davolio", "Nancy", "1968-12-08", "EmpID1.pic", "Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of 'Toastmasters International'.");
INSERT
  INTO Employees (ID, LastName, FirstName, BirthDate, Photo, Notes)
  VALUES (2, "Fuller", "Andrew", "1952-02-19", "EmpID2.pic", "Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.");
INSERT
  INTO Employees (ID, LastName, FirstName, BirthDate, Photo, Notes)
  VALUES (3, "Leverling", "Janet", "1963-08-30", "EmpID3.pic", "Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative.");
INSERT
  INTO Employees (ID, LastName, FirstName, BirthDate, Photo, Notes)
  VALUES (4, "Peacock", "Margaret", "1958-09-19", "EmpID4.pic", "Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.");
INSERT
  INTO Employees (ID, LastName, FirstName, BirthDate, Photo, Notes)
  VALUES (5, "Buchanan", "Steven", "1955-03-04", "EmpID5.pic", "Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree. Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager. Mr. Buchanan has completed the courses 'Successful Telemarketing' and 'International Sales Management'. He is fluent in French.");
INSERT
  INTO Employees (ID, LastName, FirstName, BirthDate, Photo, Notes)
  VALUES (6, "Suyama", "Michael", "1963-07-02", "EmpID6.pic", "Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing). He has also taken the courses 'Multi-Cultural Selling' and 'Time Management for the Sales Professional'. He is fluent in Japanese and can read and write French, Portuguese, and Spanish.");
INSERT
  INTO Employees (ID, LastName, FirstName, BirthDate, Photo, Notes)
  VALUES (7, "King", "Robert", "1960-05-29", "EmpID7.pic", "Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company. After completing a course entitled 'Selling in Europe', he was transferred to the London office.");
INSERT
  INTO Employees (ID, LastName, FirstName, BirthDate, Photo, Notes)
  VALUES (8, "Callahan", "Laura", "1958-01-09", "EmpID8.pic", "Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French.");
INSERT
  INTO Employees (ID, LastName, FirstName, BirthDate, Photo, Notes)
  VALUES (9, "Dodsworth", "Anne", "1969-07-02", "EmpID9.pic", "Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.");
\! echo "";
\! echo "Done inserting records into Employees tables🎉";
\! echo "";

---- Shippers ----
\! echo "Inserting records into Shippers tables...";
\! echo "";
INSERT
  INTO Shippers (ID, Name, Phone)
  VALUES (1, "Speedy Express", "(503) 555-9831");
INSERT
  INTO Shippers (ID, Name, Phone)
  VALUES (2, "United Package", "(503) 555-3199");
INSERT
  INTO Shippers (ID, Name, Phone)
  VALUES (3, "Federal Shipping", "(503) 555-9931");
\! echo "Done inserting records into Shippers tables🎉";
\! echo "";

---- Suppliers ----
\! echo "Inserting records into Suppliers tables...";
\! echo "";
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (1, "Exotic Liquid", "Charlotte Cooper", "49 Gilbert St.", "Londona", "EC1 4SD", "UK", "(171) 555-2222");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (2, "New Orleans Cajun Delights", "Shelley Burke", "P.O. Box 78934", "New Orleans", "70117", "USA", "(100) 555-4822");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (3, "Grandma Kelly's Homestead", "Regina Murphy", "707 Oxford Rd.", "Ann Arbor", "48104", "USA", "(313) 555-5735");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (4, "Tokyo Traders", "Yoshi Nagase", "9-8 Sekimai Musashino-shi", "Tokyo", "100", "Japan", "(03) 3555-5011");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (5, "Cooperativa de Quesos 'Las Cabras'", "Antonio del Valle Saavedra", "Calle del Rosal 4", "Oviedo", "33007", "Spain", "(98) 598 76 54");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (6, "Mayumi's", "Mayumi Ohno", "92 Setsuko Chuo-ku", "Osaka", "545", "Japan", "(06) 431-7877");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (7, "Pavlova, Ltd.", "Ian Devling", "74 Rose St. Moonie Ponds", "Melbourne", "3058", "Australia", "(03) 444-2343");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (8, "Specialty Biscuits, Ltd.", "Peter Wilson", "29 King's Way", "Manchester", "M14 GSD", "UK", "(161) 555-4448");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (9, "PB Knäckebröd AB", "Lars Peterson", "Kaloadagatan 13", "Göteborg", "S-345 67", "Sweden", "031-987 65 43");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (10, "Refrescos Americanas LTDA", "Carlos Diaz", "Av. das Americanas 12.890", "São Paulo", "5442", "Brazil", "(11) 555 4640");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (11, "Heli Süßwaren GmbH & Co. KG", "Petra Winkler", "Tiergartenstraße 5", "Berlin", "10785", "Germany", "(010) 9984510");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (12, "Plutzer Lebensmittelgroßmärkte AG", "Martin Bein", "Bogenallee 51", "Frankfurt", "60439", "Germany", "(069) 992755");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (13, "Nord-Ost-Fisch Handelsgesellschaft mbH", "Sven Petersen", "Frahmredder 112a", "Cuxhaven", "27478", "Germany", "(04721) 8713");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (14, "Formaggi Fortini s.r.l.", "Elio Rossi", "Viale Dante, 75", "Ravenna", "48100", "Italy", "(0544) 60323");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (15, "Norske Meierier", "Beate Vileid", "Hatlevegen 5", "Sandvika", "1320", "Norway", "(0)2-953010");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (16, "Bigfoot Breweries", "Cheryl Saylor", "3400 - 8th Avenue Suite 210", "Bend", "97101", "USA", "(503) 555-9931");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (17, "Svensk Sjöföda AB", "Michael Björn", "Brovallavägen 231", "Stockholm", "S-123 45", "Sweden", "08-123 45 67");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (18, "Aux joyeux ecclésiastiques", "Guylène Nodier", "203, Rue des Francs-Bourgeois", "Paris", "75004", "France", "(1) 03.83.00.68");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (19, "New England Seafood Cannery", "Robb Merchant", "Order Processing Dept. 2100 Paul Revere Blvd.", "Boston", "02134", "USA", "(617) 555-3267");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (20, "Leka Trading", "Chandra Leka", "471 Serangoon Loop, Suite #402", "Singapore", "0512", "Singapore", "555-8787");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (21, "Lyngbysild", "Niels Petersen", "Lyngbysild Fiskebakken 10", "Lyngby", "2800", "Denmark", "43844108");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (22, "Zaanse Snoepfabriek", "Dirk Luchte", "Verkoop Rijnweg 22", "Zaandam", "9999 ZZ", "Netherlands", "(12345) 1212");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (23, "Karkki Oy", "Anne Heikkonen", "Valtakatu 12", "Lappeenranta", "53120", "Finland", "(953) 10956");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (24, "G'day, Mate", "Wendy Mackenzie", "170 Prince Edward Parade Hunter's Hill", "Sydney", "2042", "Australia", "(02) 555-5914");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (25, "Ma Maison", "Jean-Guy Lauzon", "2960 Rue St. Laurent", "Montréal", "H1J 1C3", "Canada", "(514) 555-9022");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (26, "Pasta Buttini s.r.l.", "Giovanni Giudici", "Via dei Gelsomini, 153", "Salerno", "84100", "Italy", "(089) 6547665");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (27, "Escargots Nouveaux", "Marie Delamare", "22, rue H. Voiron", "Montceau", "71300", "France", "85.57.00.07");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (28, "Gai pâturage", "Eliane Noz", "Bat. B 3, rue des Alpes", "Annecy", "74000", "France", "38.76.98.06");
INSERT
  INTO Suppliers (ID, Name, ContactName, Address, City, ZipCode, Country, Phone)
  VALUES (29, "Forêts d'érables", "Chantal Goulet", "148 rue Chasseur", "Ste-Hyacinthe", "J2S 7S8", "Canada", "(514) 555-2955");
\! echo "";
\! echo "Done inserting records into Suppliers tables🎉";
\! echo "";

---- Products ----
\! echo "Inserting records into Products tables...";
\! echo "";
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (1, "Chais", "10 boxes x 20 bags", 18, 1, 1);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (2, "Chang", "24 - 12 oz bottles", 19, 1, 1);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (3, "Aniseed Syrup", "12 - 550 ml bottles", 10, 2, 1);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (4, "Chef Anton's Cajun Seasoning", "48 - 6 oz jars", 22, 2, 2);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (5, "Chef Anton's Gumbo Mix", "36 boxes", 21.35, 2, 2);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (6, "Grandma's Boysenberry Spread", "12 - 8 oz jars", 25, 2, 3);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (7, "Uncle Bob's Organic Dried Pears", "12 - 1 lb pkgs.", 30, 7, 3);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (8, "Northwoods Cranberry Sauce", "12 - 12 oz jars", 40, 2, 3);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (9, "Mishi Kobe Niku", "18 - 500 g pkgs.", 97, 6, 4);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (10, "Ikura", "12 - 200 ml jars", 31, 8, 4);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (11, "Queso Cabrales", "1 kg pkg.", 21, 4, 5);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (12, "Queso Manchego La Pastora", "10 - 500 g pkgs.", 38, 4, 5);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (13, "Konbu", "2 kg box", 6, 8, 6);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (14, "Tofu", "40 - 100 g pkgs.", 23.25, 7, 6);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (15, "Genen Shouyu", "24 - 250 ml bottles", 15.5, 2, 6);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (16, "Pavlova", "32 - 500 g boxes", 17.45, 3, 7);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (17, "Alice Mutton", "20 - 1 kg tins", 39, 6, 7);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (18, "Carnarvon Tigers", "16 kg pkg.", 62.5, 8, 7);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (19, "Teatime Chocolate Biscuits", "10 boxes x 12 pieces", 9.2, 3, 8);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (20, "Sir Rodney's Marmalade", "30 gift boxes", 81, 3, 8);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (21, "Sir Rodney's Scones", "24 pkgs. x 4 pieces", 10, 3, 8);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (22, "Gustaf's Knäckebröd", "24 - 500 g pkgs.", 21, 5, 9);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (23, "Tunnbröd", "12 - 250 g pkgs.", 9, 5, 9);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (24, "Guaraná Fantástica", "12 - 355 ml cans", 4.5, 1, 10);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (25, "NuNuCa Nuß-Nougat-Creme", "20 - 450 g glasses", 14, 3, 11);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (26, "Gumbär Gummibärchen", "100 - 250 g bags", 31.23, 3, 11);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (27, "Schoggi Schokolade", "100 - 100 g pieces", 43.9, 3, 11);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (28, "Rössle Sauerkraut", "25 - 825 g cans", 45.6, 7, 12);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (29, "Thüringer Rostbratwurst", "50 bags x 30 sausgs.", 123.79, 6, 12);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (30, "Nord-Ost Matjeshering", "10 - 200 g glasses", 25.89, 8, 13);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (31, "Gorgonzola Telino", "12 - 100 g pkgs", 12.5, 4, 14);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (32, "Mascarpone Fabioli", "24 - 200 g pkgs.", 32, 4, 14);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (33, "Geitost", "500 g", 2.5, 4, 15);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (34, "Sasquatch Ale", "24 - 12 oz bottles", 14, 1, 16);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (35, "Steeleye Stout", "24 - 12 oz bottles", 18, 1, 16);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (36, "Inlagd Sill", "24 - 250 g jars", 19, 8, 17);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (37, "Gravad lax", "12 - 500 g pkgs.", 26, 8, 17);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (38, "Côte de Blaye", "12 - 75 cl bottles", 263.5, 1, 18);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (39, "Chartreuse verte", "750 cc per bottle", 18, 1, 18);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (40, "Boston Crab Meat", "24 - 4 oz tins", 18.4, 8, 19);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (41, "Jack's New England Clam Chowder", "12 - 12 oz cans", 9.65, 8, 19);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (42, "Singaporean Hokkien Fried Mee", "32 - 1 kg pkgs.", 14, 5, 20);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (43, "Ipoh Coffee", "16 - 500 g tins", 46, 1, 20);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (44, "Gula Malacca", "20 - 2 kg bags", 19.45, 2, 20);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (45, "Røgede sild", "1k pkg.", 9.5, 8, 21);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (46, "Spegesild", "4 - 450 g glasses", 12, 8, 21);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (47, "Zaanse koeken", "10 - 4 oz boxes", 9.5, 3, 22);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (48, "Chocolade", "10 pkgs.", 12.75, 3, 22);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (49, "Maxilaku", "24 - 50 g pkgs.", 20, 3, 23);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (50, "Valkoinen suklaa", "12 - 100 g bars", 16.25, 3, 23);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (51, "Manjimup Dried Apples", "50 - 300 g pkgs.", 53, 7, 24);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (52, "Filo Mix", "16 - 2 kg boxes", 7, 5, 24);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (53, "Perth Pasties", "48 pieces", 32.8, 6, 24);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (54, "Tourtière", "16 pies", 7.45, 6, 25);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (55, "Pâté chinois", "24 boxes x 2 pies", 24, 6, 25);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (56, "Gnocchi di nonna Alice", "24 - 250 g pkgs.", 38, 5, 26);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (57, "Ravioli Angelo", "24 - 250 g pkgs.", 19.5, 5, 26);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (58, "Escargots de Bourgogne", "24 pieces", 13.25, 8, 27);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (59, "Raclette Courdavault", "5 kg pkg.", 55, 4, 28);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (60, "Camembert Pierrot", "15 - 300 g rounds", 34, 4, 28);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (61, "Sirop d'érable", "24 - 500 ml bottles", 28.5, 2, 29);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (62, "Tarte au sucre", "48 pies", 49.3, 3, 29);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (63, "Vegie-spread", "15 - 625 g jars", 43.9, 2, 7);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (64, "Wimmers gute Semmelknödel", "20 bags x 4 pieces", 33.25, 5, 12);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (65, "Louisiana Fiery Hot Pepper Sauce", "32 - 8 oz bottles", 21.05, 2, 2);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (66, "Louisiana Hot Spiced Okra", "24 - 8 oz jars", 17, 2, 2);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (67, "Laughing Lumberjack Lager", "24 - 12 oz bottles", 14, 1, 16);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (68, "Scottish Longbreads", "10 boxes x 8 pieces", 12.5, 3, 8);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (69, "Gudbrandsdalsost", "10 kg pkg.", 36, 4, 15);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (70, "Outback Lager", "24 - 355 ml bottles", 15, 1, 7);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (71, "Fløtemysost", "10 - 500 g pkgs.", 21.5, 4, 15);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (72, "Mozzarella di Giovanni", "24 - 200 g pkgs.", 34.8, 4, 14);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (73, "Röd Kaviar", "24 - 150 g jars", 15, 8, 17);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (74, "Longlife Tofu", "5 kg pkg.", 10, 7, 4);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (75, "Rhönbräu Klosterbier", "24 - 0.5 l bottles", 7.75, 1, 12);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (76, "Lakkalikööri", "500 ml", 18, 1, 23);
INSERT
  INTO Products (ID, Name, Unit, Price, CategoryID, SupplierID)
  VALUES (77, "Original Frankfurter grüne Soße", "12 boxes", 13, 2, 12);
\! echo "";
\! echo "Done inserting records into Products tables🎉";
\! echo "";

---- Orders ----
\! echo "Inserting records into Orders tables...";
\! echo "";
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (1, "1996-07-04", 90, 5, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (2, "1996-07-05", 81, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (3, "1996-07-08", 34, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (4, "1996-07-08", 84, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (5, "1996-07-09", 76, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (6, "1996-07-10", 34, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (7, "1996-07-11", 14, 5, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (8, "1996-07-12", 68, 9, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (9, "1996-07-15", 88, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (10, "1996-07-16", 35, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (11, "1996-07-17", 20, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (12, "1996-07-18", 13, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (13, "1996-07-19", 55, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (14, "1996-07-19", 61, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (15, "1996-07-22", 65, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (16, "1996-07-23", 20, 9, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (17, "1996-07-24", 24, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (18, "1996-07-25", 7, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (19, "1996-07-26", 87, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (20, "1996-07-29", 25, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (21, "1996-07-30", 33, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (22, "1996-07-31", 89, 5, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (23, "1996-08-01", 87, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (24, "1996-08-01", 75, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (25, "1996-08-02", 65, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (26, "1996-08-05", 63, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (27, "1996-08-06", 85, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (28, "1996-08-07", 49, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (29, "1996-08-08", 80, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (30, "1996-08-09", 52, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (31, "1996-08-12", 5, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (32, "1996-08-13", 44, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (33, "1996-08-14", 5, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (34, "1996-08-14", 69, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (35, "1996-08-15", 69, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (36, "1996-08-16", 46, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (37, "1996-08-19", 44, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (38, "1996-08-20", 63, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (39, "1996-08-21", 63, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (40, "1996-08-22", 67, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (41, "1996-08-23", 66, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (42, "1996-08-26", 11, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (43, "1996-08-27", 15, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (44, "1996-08-27", 61, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (45, "1996-08-28", 81, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (46, "1996-08-29", 80, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (47, "1996-08-30", 65, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (48, "1996-09-02", 85, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (49, "1996-09-03", 46, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (50, "1996-09-04", 7, 5, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (51, "1996-09-05", 37, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (52, "1996-09-06", 67, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (53, "1996-09-09", 49, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (54, "1996-09-09", 86, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (55, "1996-09-10", 76, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (56, "1996-09-11", 30, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (57, "1996-09-12", 80, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (58, "1996-09-13", 55, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (59, "1996-09-16", 69, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (60, "1996-09-17", 48, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (61, "1996-09-18", 2, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (62, "1996-09-19", 37, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (63, "1996-09-20", 77, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (64, "1996-09-20", 18, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (65, "1996-09-23", 86, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (66, "1996-09-24", 63, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (67, "1996-09-25", 65, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (68, "1996-09-26", 38, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (69, "1996-09-27", 65, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (70, "1996-09-30", 48, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (71, "1996-10-01", 38, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (72, "1996-10-02", 80, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (73, "1996-10-03", 87, 5, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (74, "1996-10-03", 38, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (75, "1996-10-04", 58, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (76, "1996-10-07", 39, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (77, "1996-10-08", 71, 9, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (78, "1996-10-09", 39, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (79, "1996-10-10", 8, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (80, "1996-10-11", 24, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (81, "1996-10-14", 28, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (82, "1996-10-15", 75, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (83, "1996-10-16", 46, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (84, "1996-10-16", 9, 9, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (85, "1996-10-17", 51, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (86, "1996-10-18", 87, 5, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (87, "1996-10-21", 84, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (88, "1996-10-22", 37, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (89, "1996-10-23", 60, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (90, "1996-10-24", 25, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (91, "1996-10-25", 55, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (92, "1996-10-28", 51, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (93, "1996-10-29", 9, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (94, "1996-10-29", 73, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (95, "1996-10-30", 25, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (96, "1996-10-31", 44, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (97, "1996-11-01", 89, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (98, "1996-11-04", 63, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (99, "1996-11-05", 65, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (100, "1996-11-06", 21, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (101, "1996-11-07", 86, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (102, "1996-11-08", 75, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (103, "1996-11-11", 41, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (104, "1996-11-11", 20, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (105, "1996-11-12", 28, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (106, "1996-11-13", 59, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (107, "1996-11-14", 58, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (108, "1996-11-15", 4, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (109, "1996-11-18", 86, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (110, "1996-11-19", 46, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (111, "1996-11-20", 41, 5, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (112, "1996-11-21", 72, 5, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (113, "1996-11-22", 7, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (114, "1996-11-22", 63, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (115, "1996-11-25", 9, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (116, "1996-11-26", 17, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (117, "1996-11-26", 19, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (118, "1996-11-27", 3, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (119, "1996-11-28", 29, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (120, "1996-11-28", 83, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (121, "1996-11-29", 20, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (122, "1996-12-02", 75, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (123, "1996-12-03", 14, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (124, "1996-12-03", 41, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (125, "1996-12-04", 62, 5, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (126, "1996-12-05", 37, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (127, "1996-12-05", 91, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (128, "1996-12-06", 36, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (129, "1996-12-09", 51, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (130, "1996-12-09", 72, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (131, "1996-12-10", 24, 5, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (132, "1996-12-11", 61, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (133, "1996-12-12", 37, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (134, "1996-12-12", 46, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (135, "1996-12-13", 20, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (136, "1996-12-16", 4, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (137, "1996-12-16", 5, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (138, "1996-12-17", 75, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (139, "1996-12-18", 21, 9, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (140, "1996-12-18", 70, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (141, "1996-12-19", 72, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (142, "1996-12-20", 10, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (143, "1996-12-23", 20, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (144, "1996-12-23", 17, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (145, "1996-12-24", 59, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (146, "1996-12-25", 71, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (147, "1996-12-25", 36, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (148, "1996-12-26", 35, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (149, "1996-12-27", 25, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (150, "1996-12-27", 60, 5, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (151, "1996-12-30", 71, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (152, "1996-12-31", 83, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (153, "1997-01-01", 19, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (154, "1997-01-01", 65, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (155, "1997-01-02", 20, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (156, "1997-01-03", 20, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (157, "1997-01-03", 49, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (158, "1997-01-06", 47, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (159, "1997-01-07", 62, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (160, "1997-01-07", 56, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (161, "1997-01-08", 23, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (162, "1997-01-09", 54, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (163, "1997-01-10", 10, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (164, "1997-01-10", 10, 9, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (165, "1997-01-13", 87, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (166, "1997-01-14", 41, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (167, "1997-01-14", 21, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (168, "1997-01-15", 36, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (169, "1997-01-16", 87, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (170, "1997-01-16", 73, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (171, "1997-01-17", 63, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (172, "1997-01-20", 68, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (173, "1997-01-21", 88, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (174, "1997-01-21", 61, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (175, "1997-01-22", 27, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (176, "1997-01-23", 31, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (177, "1997-01-23", 51, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (178, "1997-01-24", 41, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (179, "1997-01-27", 29, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (180, "1997-01-27", 59, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (181, "1997-01-28", 66, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (182, "1997-01-29", 37, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (183, "1997-01-30", 20, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (184, "1997-01-30", 10, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (185, "1997-01-31", 75, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (186, "1997-02-03", 60, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (187, "1997-02-03", 24, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (188, "1997-02-04", 16, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (189, "1997-02-05", 7, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (190, "1997-02-05", 87, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (191, "1997-02-06", 79, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (192, "1997-02-07", 51, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (193, "1997-02-10", 71, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (194, "1997-02-10", 55, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (195, "1997-02-11", 20, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (196, "1997-02-12", 66, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (197, "1997-02-12", 5, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (198, "1997-02-13", 5, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (199, "1997-02-14", 79, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (200, "1997-02-14", 67, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (201, "1997-02-17", 64, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (202, "1997-02-18", 7, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (203, "1997-02-19", 84, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (204, "1997-02-19", 63, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (205, "1997-02-20", 71, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (206, "1997-02-21", 4, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (207, "1997-02-21", 41, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (208, "1997-02-24", 87, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (209, "1997-02-25", 39, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (210, "1997-02-25", 39, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (211, "1997-02-26", 76, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (212, "1997-02-27", 84, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (213, "1997-02-28", 24, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (214, "1997-02-28", 46, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (215, "1997-03-03", 16, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (216, "1997-03-04", 76, 5, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (217, "1997-03-04", 28, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (218, "1997-03-05", 83, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (219, "1997-03-06", 15, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (220, "1997-03-06", 49, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (221, "1997-03-07", 39, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (222, "1997-03-10", 89, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (223, "1997-03-11", 9, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (224, "1997-03-11", 11, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (225, "1997-03-12", 72, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (226, "1997-03-13", 38, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (227, "1997-03-13", 58, 5, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (228, "1997-03-14", 76, 9, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (229, "1997-03-17", 35, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (230, "1997-03-17", 60, 5, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (231, "1997-03-18", 84, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (232, "1997-03-19", 65, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (233, "1997-03-20", 23, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (234, "1997-03-20", 67, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (235, "1997-03-21", 43, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (236, "1997-03-24", 89, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (237, "1997-03-24", 11, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (238, "1997-03-25", 47, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (239, "1997-03-26", 35, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (240, "1997-03-26", 62, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (241, "1997-03-27", 25, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (242, "1997-03-28", 59, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (243, "1997-03-31", 35, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (244, "1997-03-31", 28, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (245, "1997-04-01", 10, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (246, "1997-04-02", 41, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (247, "1997-04-02", 15, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (248, "1997-04-03", 42, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (249, "1997-04-04", 81, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (250, "1997-04-04", 44, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (251, "1997-04-07", 35, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (252, "1997-04-08", 46, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (253, "1997-04-09", 41, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (254, "1997-04-09", 6, 9, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (255, "1997-04-10", 58, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (256, "1997-04-11", 37, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (257, "1997-04-11", 89, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (258, "1997-04-14", 51, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (259, "1997-04-15", 39, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (260, "1997-04-15", 3, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (261, "1997-04-16", 56, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (262, "1997-04-17", 6, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (263, "1997-04-18", 71, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (264, "1997-04-18", 9, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (265, "1997-04-21", 21, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (266, "1997-04-22", 86, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (267, "1997-04-22", 20, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (268, "1997-04-23", 63, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (269, "1997-04-24", 37, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (270, "1997-04-24", 53, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (271, "1997-04-25", 80, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (272, "1997-04-28", 14, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (273, "1997-04-29", 70, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (274, "1997-04-29", 12, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (275, "1997-04-30", 44, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (276, "1997-05-01", 72, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (277, "1997-05-01", 5, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (278, "1997-05-02", 9, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (279, "1997-05-05", 87, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (280, "1997-05-05", 63, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (281, "1997-05-06", 32, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (282, "1997-05-07", 50, 5, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (283, "1997-05-08", 59, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (284, "1997-05-08", 54, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (285, "1997-05-09", 19, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (286, "1997-05-12", 24, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (287, "1997-05-12", 44, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (288, "1997-05-13", 3, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (289, "1997-05-14", 44, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (290, "1997-05-14", 68, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (291, "1997-05-15", 11, 9, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (292, "1997-05-16", 11, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (293, "1997-05-19", 63, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (294, "1997-05-19", 34, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (295, "1997-05-20", 39, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (296, "1997-05-21", 46, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (297, "1997-05-21", 48, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (298, "1997-05-22", 43, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (299, "1997-05-23", 84, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (300, "1997-05-23", 72, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (301, "1997-05-26", 79, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (302, "1997-05-27", 63, 5, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (303, "1997-05-28", 30, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (304, "1997-05-28", 28, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (305, "1997-05-29", 35, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (306, "1997-05-30", 87, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (307, "1997-05-30", 56, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (308, "1997-06-02", 71, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (309, "1997-06-03", 73, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (310, "1997-06-03", 44, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (311, "1997-06-04", 4, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (312, "1997-06-05", 7, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (313, "1997-06-06", 25, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (314, "1997-06-06", 24, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (315, "1997-06-09", 66, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (316, "1997-06-10", 67, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (317, "1997-06-10", 65, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (318, "1997-06-11", 51, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (319, "1997-06-12", 7, 9, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (320, "1997-06-12", 37, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (321, "1997-06-13", 29, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (322, "1997-06-16", 65, 5, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (323, "1997-06-17", 51, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (324, "1997-06-17", 20, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (325, "1997-06-18", 5, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (326, "1997-06-19", 3, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (327, "1997-06-19", 82, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (328, "1997-06-20", 52, 5, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (329, "1997-06-23", 80, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (330, "1997-06-23", 82, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (331, "1997-06-24", 11, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (332, "1997-06-25", 45, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (333, "1997-06-26", 56, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (334, "1997-06-26", 21, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (335, "1997-06-27", 6, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (336, "1997-06-30", 87, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (337, "1997-06-30", 7, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (338, "1997-07-01", 88, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (339, "1997-07-02", 66, 9, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (340, "1997-07-02", 61, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (341, "1997-07-03", 63, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (342, "1997-07-04", 32, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (343, "1997-07-07", 51, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (344, "1997-07-07", 83, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (345, "1997-07-08", 44, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (346, "1997-07-09", 44, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (347, "1997-07-09", 55, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (348, "1997-07-10", 20, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (349, "1997-07-11", 89, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (350, "1997-07-11", 59, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (351, "1997-07-14", 65, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (352, "1997-07-15", 11, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (353, "1997-07-16", 36, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (354, "1997-07-16", 35, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (355, "1997-07-17", 83, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (356, "1997-07-18", 71, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (357, "1997-07-18", 28, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (358, "1997-07-21", 51, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (359, "1997-07-22", 81, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (360, "1997-07-22", 71, 5, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (361, "1997-07-23", 79, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (362, "1997-07-24", 18, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (363, "1997-07-25", 41, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (364, "1997-07-25", 91, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (365, "1997-07-28", 71, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (366, "1997-07-29", 35, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (367, "1997-07-29", 6, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (368, "1997-07-30", 90, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (369, "1997-07-31", 32, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (370, "1997-07-31", 32, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (371, "1997-08-01", 51, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (372, "1997-08-04", 51, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (373, "1997-08-05", 42, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (374, "1997-08-05", 38, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (375, "1997-08-06", 67, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (376, "1997-08-07", 25, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (377, "1997-08-07", 78, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (378, "1997-08-08", 2, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (379, "1997-08-11", 5, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (380, "1997-08-11", 71, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (381, "1997-08-12", 7, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (382, "1997-08-12", 30, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (383, "1997-08-13", 39, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (384, "1997-08-14", 41, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (385, "1997-08-14", 86, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (386, "1997-08-15", 20, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (387, "1997-08-15", 23, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (388, "1997-08-18", 49, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (389, "1997-08-19", 87, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (390, "1997-08-19", 62, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (391, "1997-08-20", 47, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (392, "1997-08-20", 70, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (393, "1997-08-21", 86, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (394, "1997-08-22", 35, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (395, "1997-08-22", 73, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (396, "1997-08-25", 1, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (397, "1997-08-25", 88, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (398, "1997-08-26", 34, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (399, "1997-08-27", 37, 9, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (400, "1997-08-27", 61, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (401, "1997-08-28", 67, 5, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (402, "1997-08-28", 50, 5, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (403, "1997-08-29", 21, 5, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (404, "1997-09-01", 86, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (405, "1997-09-01", 31, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (406, "1997-09-02", 25, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (407, "1997-09-02", 5, 5, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (408, "1997-09-03", 66, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (409, "1997-09-04", 32, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (410, "1997-09-04", 71, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (411, "1997-09-05", 63, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (412, "1997-09-05", 62, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (413, "1997-09-08", 36, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (414, "1997-09-09", 37, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (415, "1997-09-09", 48, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (416, "1997-09-10", 9, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (417, "1997-09-10", 28, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (418, "1997-09-11", 48, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (419, "1997-09-12", 68, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (420, "1997-09-12", 20, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (421, "1997-09-15", 86, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (422, "1997-09-15", 73, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (423, "1997-09-16", 25, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (424, "1997-09-17", 26, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (425, "1997-09-17", 5, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (426, "1997-09-18", 90, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (427, "1997-09-18", 38, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (428, "1997-09-19", 25, 5, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (429, "1997-09-22", 80, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (430, "1997-09-22", 3, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (431, "1997-09-23", 71, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (432, "1997-09-23", 7, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (433, "1997-09-24", 55, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (434, "1997-09-25", 32, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (435, "1997-09-25", 3, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (436, "1997-09-26", 18, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (437, "1997-09-26", 56, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (438, "1997-09-29", 31, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (439, "1997-09-30", 59, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (440, "1997-09-30", 37, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (441, "1997-10-01", 83, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (442, "1997-10-01", 5, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (443, "1997-10-02", 34, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (444, "1997-10-03", 63, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (445, "1997-10-03", 1, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (446, "1997-10-06", 89, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (447, "1997-10-06", 63, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (448, "1997-10-07", 90, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (449, "1997-10-08", 89, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (450, "1997-10-08", 47, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (451, "1997-10-09", 20, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (452, "1997-10-09", 52, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (453, "1997-10-10", 71, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (454, "1997-10-13", 37, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (455, "1997-10-13", 1, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (456, "1997-10-14", 24, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (457, "1997-10-14", 62, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (458, "1997-10-15", 35, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (459, "1997-10-16", 55, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (460, "1997-10-16", 4, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (461, "1997-10-17", 77, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (462, "1997-10-17", 31, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (463, "1997-10-20", 27, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (464, "1997-10-21", 71, 5, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (465, "1997-10-21", 37, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (466, "1997-10-22", 71, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (467, "1997-10-22", 71, 5, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (468, "1997-10-23", 9, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (469, "1997-10-24", 64, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (470, "1997-10-24", 25, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (471, "1997-10-27", 39, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (472, "1997-10-27", 45, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (473, "1997-10-28", 61, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (474, "1997-10-29", 63, 5, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (475, "1997-10-29", 71, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (476, "1997-10-30", 89, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (477, "1997-10-30", 51, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (478, "1997-10-31", 21, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (479, "1997-11-03", 19, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (480, "1997-11-03", 66, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (481, "1997-11-04", 62, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (482, "1997-11-04", 47, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (483, "1997-11-05", 9, 5, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (484, "1997-11-06", 14, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (485, "1997-11-06", 9, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (486, "1997-11-07", 5, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (487, "1997-11-07", 31, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (488, "1997-11-10", 45, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (489, "1997-11-11", 37, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (490, "1997-11-11", 85, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (491, "1997-11-12", 74, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (492, "1997-11-12", 85, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (493, "1997-11-13", 89, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (494, "1997-11-14", 4, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (495, "1997-11-14", 10, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (496, "1997-11-17", 4, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (497, "1997-11-17", 83, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (498, "1997-11-18", 63, 9, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (499, "1997-11-19", 14, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (500, "1997-11-19", 59, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (501, "1997-11-20", 71, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (502, "1997-11-20", 38, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (503, "1997-11-21", 87, 9, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (504, "1997-11-24", 68, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (505, "1997-11-24", 53, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (506, "1997-11-25", 27, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (507, "1997-11-25", 49, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (508, "1997-11-26", 9, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (509, "1997-11-27", 75, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (510, "1997-11-27", 71, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (511, "1997-11-28", 68, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (512, "1997-11-28", 2, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (513, "1997-12-01", 50, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (514, "1997-12-02", 65, 5, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (515, "1997-12-02", 24, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (516, "1997-12-03", 23, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (517, "1997-12-03", 20, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (518, "1997-12-04", 63, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (519, "1997-12-05", 56, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (520, "1997-12-05", 76, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (521, "1997-12-08", 4, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (522, "1997-12-08", 83, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (523, "1997-12-09", 34, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (524, "1997-12-10", 20, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (525, "1997-12-10", 44, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (526, "1997-12-11", 20, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (527, "1997-12-11", 24, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (528, "1997-12-12", 78, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (529, "1997-12-15", 20, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (530, "1997-12-15", 31, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (531, "1997-12-16", 5, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (532, "1997-12-16", 52, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (533, "1997-12-16", 46, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (534, "1997-12-17", 87, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (535, "1997-12-17", 12, 9, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (536, "1997-12-18", 34, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (537, "1997-12-18", 49, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (538, "1997-12-18", 33, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (539, "1997-12-19", 62, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (540, "1997-12-19", 41, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (541, "1997-12-22", 63, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (542, "1997-12-22", 23, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (543, "1997-12-22", 31, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (544, "1997-12-23", 25, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (545, "1997-12-23", 91, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (546, "1997-12-24", 4, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (547, "1997-12-24", 61, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (548, "1997-12-24", 20, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (549, "1997-12-25", 35, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (550, "1997-12-25", 17, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (551, "1997-12-26", 38, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (552, "1997-12-26", 39, 9, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (553, "1997-12-26", 72, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (554, "1997-12-29", 8, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (555, "1997-12-29", 73, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (556, "1997-12-30", 88, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (557, "1997-12-30", 72, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (558, "1997-12-30", 77, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (559, "1997-12-31", 84, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (560, "1997-12-31", 27, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (561, "1998-01-01", 60, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (562, "1998-01-01", 88, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (563, "1998-01-01", 42, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (564, "1998-01-02", 47, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (565, "1998-01-02", 66, 5, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (566, "1998-01-05", 67, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (567, "1998-01-05", 84, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (568, "1998-01-05", 71, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (569, "1998-01-06", 32, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (570, "1998-01-06", 39, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (571, "1998-01-07", 49, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (572, "1998-01-07", 12, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (573, "1998-01-07", 65, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (574, "1998-01-08", 75, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (575, "1998-01-08", 82, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (576, "1998-01-09", 46, 5, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (577, "1998-01-09", 24, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (578, "1998-01-09", 17, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (579, "1998-01-12", 7, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (580, "1998-01-12", 9, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (581, "1998-01-13", 64, 9, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (582, "1998-01-13", 38, 9, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (583, "1998-01-13", 81, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (584, "1998-01-14", 70, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (585, "1998-01-14", 41, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (586, "1998-01-15", 56, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (587, "1998-01-15", 81, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (588, "1998-01-15", 1, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (589, "1998-01-16", 20, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (590, "1998-01-16", 5, 9, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (591, "1998-01-19", 47, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (592, "1998-01-19", 81, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (593, "1998-01-19", 47, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (594, "1998-01-20", 76, 5, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (595, "1998-01-20", 80, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (596, "1998-01-21", 84, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (597, "1998-01-21", 59, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (598, "1998-01-21", 63, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (599, "1998-01-22", 76, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (600, "1998-01-22", 71, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (601, "1998-01-23", 16, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (602, "1998-01-23", 39, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (603, "1998-01-23", 84, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (604, "1998-01-26", 67, 5, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (605, "1998-01-26", 65, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (606, "1998-01-27", 6, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (607, "1998-01-27", 20, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (608, "1998-01-27", 55, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (609, "1998-01-28", 3, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (610, "1998-01-28", 5, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (611, "1998-01-29", 40, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (612, "1998-01-29", 25, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (613, "1998-01-29", 26, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (614, "1998-01-30", 89, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (615, "1998-01-30", 44, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (616, "1998-02-02", 35, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (617, "1998-02-02", 4, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (618, "1998-02-02", 63, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (619, "1998-02-03", 5, 5, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (620, "1998-02-03", 48, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (621, "1998-02-04", 62, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (622, "1998-02-04", 72, 5, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (623, "1998-02-04", 91, 5, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (624, "1998-02-05", 9, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (625, "1998-02-05", 30, 5, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (626, "1998-02-06", 90, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (627, "1998-02-06", 30, 5, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (628, "1998-02-06", 5, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (629, "1998-02-09", 9, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (630, "1998-02-09", 67, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (631, "1998-02-10", 63, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (632, "1998-02-10", 90, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (633, "1998-02-10", 24, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (634, "1998-02-11", 12, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (635, "1998-02-11", 71, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (636, "1998-02-12", 48, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (637, "1998-02-12", 45, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (638, "1998-02-12", 76, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (639, "1998-02-13", 34, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (640, "1998-02-13", 29, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (641, "1998-02-16", 30, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (642, "1998-02-16", 65, 9, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (643, "1998-02-16", 18, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (644, "1998-02-17", 44, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (645, "1998-02-17", 50, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (646, "1998-02-18", 39, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (647, "1998-02-18", 71, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (648, "1998-02-18", 20, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (649, "1998-02-19", 50, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (650, "1998-02-19", 37, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (651, "1998-02-20", 54, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (652, "1998-02-20", 46, 5, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (653, "1998-02-20", 88, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (654, "1998-02-23", 35, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (655, "1998-02-23", 24, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (656, "1998-02-24", 34, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (657, "1998-02-24", 89, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (658, "1998-02-24", 88, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (659, "1998-02-25", 91, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (660, "1998-02-25", 74, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (661, "1998-02-26", 66, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (662, "1998-02-26", 70, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (663, "1998-02-26", 90, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (664, "1998-02-26", 30, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (665, "1998-02-26", 37, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (666, "1998-02-26", 62, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (667, "1998-02-27", 62, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (668, "1998-02-27", 80, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (669, "1998-02-27", 64, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (670, "1998-03-02", 69, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (671, "1998-03-02", 10, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (672, "1998-03-02", 47, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (673, "1998-03-03", 4, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (674, "1998-03-03", 83, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (675, "1998-03-03", 34, 5, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (676, "1998-03-03", 41, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (677, "1998-03-04", 5, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (678, "1998-03-04", 34, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (679, "1998-03-04", 2, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (680, "1998-03-05", 40, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (681, "1998-03-05", 29, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (682, "1998-03-05", 25, 6, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (683, "1998-03-06", 76, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (684, "1998-03-06", 68, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (685, "1998-03-06", 9, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (686, "1998-03-06", 38, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (687, "1998-03-09", 44, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (688, "1998-03-09", 88, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (689, "1998-03-09", 32, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (690, "1998-03-10", 12, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (691, "1998-03-10", 63, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (692, "1998-03-10", 49, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (693, "1998-03-11", 9, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (694, "1998-03-11", 71, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (695, "1998-03-11", 66, 9, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (696, "1998-03-11", 11, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (697, "1998-03-12", 10, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (698, "1998-03-12", 52, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (699, "1998-03-12", 83, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (700, "1998-03-13", 11, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (701, "1998-03-13", 30, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (702, "1998-03-13", 10, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (703, "1998-03-16", 49, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (704, "1998-03-16", 68, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (705, "1998-03-16", 1, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (706, "1998-03-16", 4, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (707, "1998-03-17", 47, 5, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (708, "1998-03-17", 24, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (709, "1998-03-17", 6, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (710, "1998-03-18", 35, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (711, "1998-03-18", 54, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (712, "1998-03-18", 31, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (713, "1998-03-19", 35, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (714, "1998-03-19", 62, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (715, "1998-03-19", 63, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (716, "1998-03-19", 28, 9, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (717, "1998-03-20", 74, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (718, "1998-03-20", 55, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (719, "1998-03-20", 14, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (720, "1998-03-23", 79, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (721, "1998-03-23", 20, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (722, "1998-03-23", 15, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (723, "1998-03-24", 8, 9, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (724, "1998-03-24", 26, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (725, "1998-03-24", 40, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (726, "1998-03-24", 40, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (727, "1998-03-25", 75, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (728, "1998-03-25", 10, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (729, "1998-03-25", 35, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (730, "1998-03-26", 24, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (731, "1998-03-26", 50, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (732, "1998-03-26", 20, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (733, "1998-03-27", 24, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (734, "1998-03-27", 34, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (735, "1998-03-27", 10, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (736, "1998-03-27", 71, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (737, "1998-03-30", 71, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (738, "1998-03-30", 37, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (739, "1998-03-30", 54, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (740, "1998-03-31", 19, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (741, "1998-03-31", 65, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (742, "1998-03-31", 61, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (743, "1998-04-01", 20, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (744, "1998-04-01", 63, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (745, "1998-04-01", 77, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (746, "1998-04-01", 24, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (747, "1998-04-02", 83, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (748, "1998-04-02", 58, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (749, "1998-04-02", 63, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (750, "1998-04-03", 46, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (751, "1998-04-03", 91, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (752, "1998-04-03", 56, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (753, "1998-04-06", 65, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (754, "1998-04-06", 24, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (755, "1998-04-06", 71, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (756, "1998-04-06", 78, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (757, "1998-04-07", 50, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (758, "1998-04-07", 90, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (759, "1998-04-07", 32, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (760, "1998-04-08", 60, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (761, "1998-04-08", 20, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (762, "1998-04-08", 30, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (763, "1998-04-09", 66, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (764, "1998-04-09", 1, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (765, "1998-04-09", 25, 1, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (766, "1998-04-09", 69, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (767, "1998-04-10", 47, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (768, "1998-04-10", 70, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (769, "1998-04-10", 4, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (770, "1998-04-13", 20, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (771, "1998-04-13", 48, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (772, "1998-04-13", 64, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (773, "1998-04-14", 56, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (774, "1998-04-14", 63, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (775, "1998-04-14", 34, 9, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (776, "1998-04-14", 11, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (777, "1998-04-15", 19, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (778, "1998-04-15", 87, 6, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (779, "1998-04-15", 27, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (780, "1998-04-16", 10, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (781, "1998-04-16", 39, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (782, "1998-04-16", 14, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (783, "1998-04-17", 71, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (784, "1998-04-17", 71, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (785, "1998-04-17", 89, 2, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (786, "1998-04-17", 68, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (787, "1998-04-20", 55, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (788, "1998-04-20", 76, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (789, "1998-04-20", 17, 8, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (790, "1998-04-21", 30, 7, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (791, "1998-04-21", 76, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (792, "1998-04-21", 47, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (793, "1998-04-22", 32, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (794, "1998-04-22", 14, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (795, "1998-04-22", 15, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (796, "1998-04-22", 74, 5, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (797, "1998-04-23", 91, 4, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (798, "1998-04-23", 10, 6, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (799, "1998-04-23", 86, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (800, "1998-04-24", 19, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (801, "1998-04-24", 10, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (802, "1998-04-24", 31, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (803, "1998-04-27", 24, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (804, "1998-04-27", 41, 7, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (805, "1998-04-27", 34, 3, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (806, "1998-04-27", 59, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (807, "1998-04-28", 12, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (808, "1998-04-28", 35, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (809, "1998-04-28", 19, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (810, "1998-04-29", 53, 3, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (811, "1998-04-29", 6, 9, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (812, "1998-04-29", 67, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (813, "1998-04-30", 27, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (814, "1998-04-30", 32, 4, 3);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (815, "1998-04-30", 66, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (816, "1998-04-30", 37, 3, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (817, "1998-05-01", 71, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (818, "1998-05-01", 46, 8, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (819, "1998-05-01", 89, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (820, "1998-05-04", 17, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (821, "1998-05-04", 62, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (822, "1998-05-04", 80, 1, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (823, "1998-05-05", 44, 2, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (824, "1998-05-05", 46, 1, 1);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (825, "1998-05-05", 20, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (826, "1998-05-05", 58, 2, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (827, "1998-05-06", 73, 7, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (828, "1998-05-06", 68, 8, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (829, "1998-05-06", 9, 4, 2);
INSERT
  INTO Orders (ID, OrderDate, CustomerID, EmployeeID, ShipperID)
  VALUES (830, "1998-05-06", 65, 1, 2);
\! echo "";
\! echo "Done inserting records into Orders tables🎉";
\! echo "";

---- OrderDetails ----
\! echo "Inserting records into OrderDetails tables...";
\! echo "";
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1, 12, 1, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2, 10, 1, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (3, 5, 1, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (4, 9, 2, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (5, 40, 2, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (6, 10, 3, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (7, 35, 3, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (8, 15, 3, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (9, 6, 4, 22);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (10, 15, 4, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (11, 20, 4, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (12, 40, 5, 20);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (13, 25, 5, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (14, 40, 5, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (15, 20, 6, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (16, 42, 6, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (17, 40, 6, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (18, 15, 7, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (19, 21, 7, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (20, 21, 7, 74);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (21, 20, 8, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (22, 35, 8, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (23, 25, 8, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (24, 30, 8, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (25, 15, 9, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (26, 12, 9, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (27, 25, 10, 27);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (28, 6, 10, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (29, 15, 10, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (30, 50, 11, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (31, 65, 11, 5);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (32, 6, 11, 32);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (33, 10, 12, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (34, 1, 12, 37);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (35, 16, 13, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (36, 50, 13, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (37, 15, 13, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (38, 21, 13, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (39, 20, 14, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (40, 20, 14, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (41, 12, 15, 5);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (42, 15, 15, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (43, 2, 15, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (44, 60, 16, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (45, 28, 16, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (46, 60, 16, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (47, 36, 16, 74);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (48, 35, 17, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (49, 25, 17, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (50, 30, 18, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (51, 20, 18, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (52, 12, 19, 12);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (53, 50, 20, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (54, 70, 20, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (55, 15, 20, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (56, 10, 21, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (57, 4, 21, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (58, 60, 22, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (59, 20, 22, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (60, 30, 23, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (61, 25, 23, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (62, 24, 24, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (63, 6, 25, 20);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (64, 40, 25, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (65, 24, 25, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (66, 24, 26, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (67, 15, 26, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (68, 20, 26, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (69, 60, 26, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (70, 33, 26, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (71, 20, 27, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (72, 7, 27, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (73, 12, 28, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (74, 6, 28, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (75, 15, 29, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (76, 10, 29, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (77, 20, 30, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (78, 12, 30, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (79, 16, 31, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (80, 15, 31, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (81, 8, 31, 63);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (82, 25, 31, 73);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (83, 15, 32, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (84, 12, 33, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (85, 20, 33, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (86, 30, 33, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (87, 1, 34, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (88, 6, 34, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (89, 4, 34, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (90, 6, 35, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (91, 2, 35, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (92, 20, 36, 15);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (93, 18, 36, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (94, 35, 36, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (95, 3, 36, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (96, 15, 37, 27);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (97, 21, 37, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (98, 20, 37, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (99, 5, 37, 67);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (100, 45, 38, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (101, 40, 38, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (102, 36, 38, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (103, 100, 39, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (104, 40, 39, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (105, 40, 40, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (106, 20, 40, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (107, 15, 40, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (108, 10, 41, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (109, 3, 41, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (110, 30, 42, 3);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (111, 9, 42, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (112, 20, 43, 5);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (113, 15, 43, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (114, 15, 43, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (115, 10, 43, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (116, 20, 44, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (117, 24, 44, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (118, 2, 44, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (119, 20, 45, 20);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (120, 12, 46, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (121, 10, 46, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (122, 5, 46, 63);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (123, 6, 46, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (124, 18, 47, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (125, 15, 47, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (126, 15, 47, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (127, 21, 47, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (128, 6, 47, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (129, 4, 48, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (130, 12, 49, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (131, 30, 49, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (132, 15, 49, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (133, 60, 50, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (134, 20, 50, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (135, 40, 51, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (136, 40, 51, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (137, 30, 51, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (138, 15, 51, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (139, 15, 52, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (140, 20, 52, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (141, 30, 53, 66);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (142, 20, 53, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (143, 10, 54, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (144, 20, 54, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (145, 40, 55, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (146, 28, 55, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (147, 12, 55, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (148, 40, 56, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (149, 30, 56, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (150, 15, 56, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (151, 30, 57, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (152, 10, 57, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (153, 2, 57, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (154, 25, 58, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (155, 25, 58, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (156, 30, 58, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (157, 10, 59, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (158, 10, 59, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (159, 5, 59, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (160, 10, 60, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (161, 3, 60, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (162, 1, 61, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (163, 5, 61, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (164, 20, 62, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (165, 30, 62, 6);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (166, 2, 62, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (167, 20, 62, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (168, 3, 62, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (169, 10, 63, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (170, 5, 63, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (171, 6, 64, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (172, 7, 64, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (173, 4, 65, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (174, 24, 65, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (175, 20, 65, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (176, 10, 65, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (177, 12, 66, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (178, 40, 67, 32);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (179, 30, 67, 58);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (180, 25, 67, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (181, 14, 68, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (182, 30, 68, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (183, 10, 69, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (184, 70, 69, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (185, 20, 70, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (186, 20, 71, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (187, 6, 71, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (188, 8, 72, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (189, 14, 72, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (190, 30, 72, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (191, 30, 73, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (192, 10, 74, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (193, 20, 75, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (194, 5, 76, 15);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (195, 4, 76, 25);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (196, 4, 76, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (197, 21, 77, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (198, 70, 77, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (199, 30, 77, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (200, 40, 77, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (201, 80, 77, 63);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (202, 6, 78, 6);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (203, 12, 78, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (204, 9, 78, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (205, 4, 78, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (206, 40, 78, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (207, 24, 79, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (208, 16, 79, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (209, 50, 79, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (210, 25, 80, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (211, 50, 80, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (212, 35, 80, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (213, 30, 80, 58);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (214, 9, 81, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (215, 40, 81, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (216, 10, 81, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (217, 10, 82, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (218, 8, 82, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (219, 20, 82, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (220, 12, 82, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (221, 50, 83, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (222, 25, 83, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (223, 15, 84, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (224, 40, 85, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (225, 10, 85, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (226, 16, 85, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (227, 10, 86, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (228, 10, 86, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (229, 40, 86, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (230, 8, 87, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (231, 10, 87, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (232, 7, 88, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (233, 25, 88, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (234, 6, 88, 32);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (235, 48, 88, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (236, 18, 89, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (237, 40, 90, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (238, 24, 90, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (239, 20, 90, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (240, 28, 90, 37);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (241, 25, 90, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (242, 20, 91, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (243, 15, 91, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (244, 10, 92, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (245, 70, 92, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (246, 28, 92, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (247, 20, 93, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (248, 12, 93, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (249, 40, 93, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (250, 8, 94, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (251, 9, 94, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (252, 24, 95, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (253, 56, 95, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (254, 40, 95, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (255, 40, 95, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (256, 50, 96, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (257, 4, 96, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (258, 15, 96, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (259, 35, 97, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (260, 70, 97, 8);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (261, 70, 98, 8);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (262, 80, 98, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (263, 9, 98, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (264, 36, 99, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (265, 20, 99, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (266, 10, 100, 25);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (267, 50, 100, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (268, 4, 100, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (269, 6, 100, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (270, 15, 101, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (271, 25, 101, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (272, 24, 102, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (273, 15, 103, 50);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (274, 18, 103, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (275, 20, 104, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (276, 13, 104, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (277, 77, 104, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (278, 10, 104, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (279, 10, 105, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (280, 20, 105, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (281, 12, 106, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (282, 50, 106, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (283, 12, 107, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (284, 4, 107, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (285, 25, 108, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (286, 25, 108, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (287, 30, 109, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (288, 12, 109, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (289, 20, 109, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (290, 30, 110, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (291, 16, 110, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (292, 8, 110, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (293, 10, 111, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (294, 10, 111, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (295, 20, 111, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (296, 56, 112, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (297, 70, 112, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (298, 80, 112, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (299, 30, 113, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (300, 35, 113, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (301, 10, 113, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (302, 35, 113, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (303, 28, 113, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (304, 54, 114, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (305, 55, 114, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (306, 50, 115, 25);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (307, 20, 115, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (308, 24, 115, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (309, 20, 116, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (310, 12, 116, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (311, 12, 116, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (312, 30, 117, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (313, 5, 117, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (314, 24, 118, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (315, 5, 119, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (316, 5, 119, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (317, 36, 120, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (318, 18, 120, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (319, 15, 120, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (320, 7, 120, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (321, 5, 121, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (322, 13, 121, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (323, 25, 121, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (324, 35, 121, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (325, 20, 122, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (326, 18, 122, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (327, 15, 123, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (328, 30, 123, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (329, 20, 123, 74);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (330, 6, 124, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (331, 12, 125, 20);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (332, 40, 125, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (333, 70, 125, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (334, 42, 125, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (335, 80, 126, 58);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (336, 50, 126, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (337, 30, 127, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (338, 15, 127, 58);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (339, 15, 128, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (340, 10, 128, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (341, 42, 129, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (342, 20, 130, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (343, 20, 130, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (344, 6, 131, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (345, 8, 132, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (346, 16, 132, 63);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (347, 20, 132, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (348, 18, 133, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (349, 20, 133, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (350, 6, 133, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (351, 30, 133, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (352, 14, 134, 74);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (353, 32, 135, 5);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (354, 9, 135, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (355, 14, 135, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (356, 60, 135, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (357, 50, 135, 74);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (358, 20, 136, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (359, 15, 136, 50);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (360, 20, 136, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (361, 28, 137, 20);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (362, 15, 137, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (363, 10, 138, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (364, 20, 138, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (365, 8, 138, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (366, 15, 139, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (367, 10, 139, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (368, 15, 140, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (369, 6, 140, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (370, 12, 140, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (371, 15, 140, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (372, 15, 141, 45);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (373, 20, 141, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (374, 40, 141, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (375, 16, 142, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (376, 15, 142, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (377, 20, 142, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (378, 30, 142, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (379, 60, 143, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (380, 40, 143, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (381, 45, 143, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (382, 24, 143, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (383, 18, 144, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (384, 50, 145, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (385, 25, 146, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (386, 42, 146, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (387, 7, 146, 25);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (388, 70, 146, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (389, 32, 146, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (390, 10, 147, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (391, 10, 147, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (392, 28, 148, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (393, 70, 148, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (394, 8, 148, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (395, 40, 149, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (396, 60, 149, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (397, 21, 149, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (398, 10, 150, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (399, 18, 150, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (400, 30, 151, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (401, 120, 151, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (402, 60, 152, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (403, 30, 152, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (404, 35, 152, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (405, 14, 152, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (406, 21, 153, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (407, 35, 153, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (408, 30, 153, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (409, 18, 154, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (410, 70, 154, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (411, 20, 154, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (412, 60, 154, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (413, 60, 155, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (414, 65, 155, 63);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (415, 21, 156, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (416, 70, 156, 48);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (417, 30, 157, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (418, 40, 157, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (419, 30, 157, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (420, 50, 158, 3);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (421, 10, 159, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (422, 30, 159, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (423, 42, 159, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (424, 5, 159, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (425, 2, 159, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (426, 30, 160, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (427, 15, 160, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (428, 15, 160, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (429, 10, 161, 37);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (430, 6, 161, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (431, 35, 161, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (432, 12, 162, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (433, 12, 162, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (434, 49, 163, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (435, 16, 163, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (436, 25, 164, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (437, 40, 164, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (438, 9, 164, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (439, 20, 165, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (440, 24, 166, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (441, 40, 166, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (442, 14, 166, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (443, 18, 167, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (444, 50, 167, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (445, 2, 168, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (446, 20, 168, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (447, 20, 169, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (448, 10, 169, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (449, 20, 169, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (450, 50, 170, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (451, 2, 170, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (452, 36, 170, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (453, 35, 170, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (454, 60, 171, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (455, 55, 171, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (456, 16, 171, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (457, 15, 171, 74);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (458, 60, 172, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (459, 20, 172, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (460, 20, 173, 9);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (461, 2, 173, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (462, 8, 173, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (463, 20, 173, 73);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (464, 4, 174, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (465, 30, 174, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (466, 15, 174, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (467, 10, 174, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (468, 2, 175, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (469, 14, 176, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (470, 20, 176, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (471, 60, 177, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (472, 49, 177, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (473, 30, 177, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (474, 10, 178, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (475, 20, 178, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (476, 5, 179, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (477, 7, 179, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (478, 35, 180, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (479, 20, 181, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (480, 40, 182, 50);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (481, 35, 182, 63);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (482, 45, 183, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (483, 50, 183, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (484, 30, 183, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (485, 70, 183, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (486, 50, 184, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (487, 50, 184, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (488, 30, 184, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (489, 10, 185, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (490, 40, 185, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (491, 28, 186, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (492, 6, 187, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (493, 18, 187, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (494, 10, 188, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (495, 12, 188, 22);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (496, 10, 188, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (497, 5, 189, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (498, 40, 189, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (499, 30, 189, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (500, 24, 189, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (501, 15, 190, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (502, 15, 191, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (503, 20, 191, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (504, 15, 191, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (505, 15, 192, 12);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (506, 16, 192, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (507, 6, 192, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (508, 30, 192, 74);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (509, 45, 193, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (510, 49, 193, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (511, 24, 193, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (512, 90, 193, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (513, 50, 194, 27);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (514, 30, 195, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (515, 80, 195, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (516, 60, 195, 66);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (517, 6, 196, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (518, 12, 196, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (519, 10, 197, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (520, 15, 197, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (521, 8, 197, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (522, 30, 197, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (523, 6, 198, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (524, 15, 198, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (525, 12, 199, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (526, 20, 199, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (527, 3, 199, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (528, 15, 199, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (529, 40, 200, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (530, 35, 200, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (531, 2, 200, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (532, 6, 201, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (533, 20, 201, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (534, 14, 202, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (535, 20, 202, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (536, 35, 202, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (537, 20, 203, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (538, 6, 203, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (539, 120, 204, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (540, 35, 204, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (541, 28, 204, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (542, 55, 204, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (543, 15, 205, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (544, 100, 205, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (545, 15, 206, 48);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (546, 25, 206, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (547, 20, 207, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (548, 20, 207, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (549, 10, 207, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (550, 20, 208, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (551, 50, 208, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (552, 25, 208, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (553, 30, 208, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (554, 40, 209, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (555, 21, 209, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (556, 36, 210, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (557, 30, 211, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (558, 30, 211, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (559, 20, 211, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (560, 15, 211, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (561, 50, 211, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (562, 16, 212, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (563, 20, 212, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (564, 40, 212, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (565, 21, 213, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (566, 4, 213, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (567, 40, 214, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (568, 28, 214, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (569, 60, 214, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (570, 1, 215, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (571, 21, 215, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (572, 21, 216, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (573, 50, 216, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (574, 16, 217, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (575, 3, 217, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (576, 30, 217, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (577, 20, 217, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (578, 25, 218, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (579, 18, 218, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (580, 20, 218, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (581, 30, 218, 45);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (582, 25, 218, 50);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (583, 10, 219, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (584, 5, 219, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (585, 28, 220, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (586, 12, 220, 25);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (587, 8, 221, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (588, 15, 221, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (589, 40, 222, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (590, 35, 222, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (591, 2, 222, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (592, 30, 223, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (593, 15, 223, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (594, 8, 223, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (595, 30, 224, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (596, 20, 224, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (597, 80, 225, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (598, 18, 225, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (599, 12, 226, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (600, 12, 226, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (601, 12, 227, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (602, 18, 227, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (603, 21, 227, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (604, 10, 227, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (605, 35, 228, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (606, 60, 228, 66);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (607, 42, 228, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (608, 2, 229, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (609, 12, 229, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (610, 15, 230, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (611, 21, 230, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (612, 20, 230, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (613, 20, 231, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (614, 30, 232, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (615, 28, 232, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (616, 60, 232, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (617, 30, 232, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (618, 30, 233, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (619, 12, 233, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (620, 24, 234, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (621, 40, 234, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (622, 10, 235, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (623, 35, 236, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (624, 30, 236, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (625, 14, 237, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (626, 10, 237, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (627, 3, 237, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (628, 20, 238, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (629, 20, 238, 3);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (630, 30, 238, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (631, 60, 238, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (632, 5, 239, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (633, 25, 239, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (634, 16, 239, 74);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (635, 5, 240, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (636, 30, 240, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (637, 24, 240, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (638, 30, 241, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (639, 20, 241, 73);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (640, 15, 242, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (641, 18, 242, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (642, 60, 243, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (643, 30, 243, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (644, 36, 243, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (645, 15, 244, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (646, 7, 244, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (647, 60, 245, 25);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (648, 20, 245, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (649, 15, 246, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (650, 10, 246, 66);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (651, 10, 246, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (652, 30, 247, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (653, 10, 248, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (654, 20, 248, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (655, 5, 248, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (656, 20, 249, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (657, 14, 250, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (658, 25, 250, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (659, 25, 250, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (660, 14, 251, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (661, 5, 251, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (662, 30, 251, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (663, 20, 252, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (664, 25, 252, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (665, 12, 253, 15);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (666, 8, 253, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (667, 20, 254, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (668, 21, 255, 45);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (669, 6, 255, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (670, 30, 255, 67);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (671, 70, 256, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (672, 20, 256, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (673, 12, 257, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (674, 12, 257, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (675, 10, 257, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (676, 25, 257, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (677, 3, 258, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (678, 18, 259, 25);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (679, 14, 259, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (680, 15, 260, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (681, 15, 260, 48);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (682, 10, 261, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (683, 10, 261, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (684, 3, 262, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (685, 36, 263, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (686, 36, 263, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (687, 50, 264, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (688, 50, 264, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (689, 10, 264, 8);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (690, 10, 265, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (691, 9, 265, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (692, 6, 265, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (693, 12, 265, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (694, 40, 266, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (695, 50, 266, 32);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (696, 15, 266, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (697, 39, 267, 20);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (698, 35, 267, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (699, 70, 267, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (700, 39, 267, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (701, 50, 267, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (702, 16, 268, 9);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (703, 50, 268, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (704, 120, 268, 27);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (705, 16, 268, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (706, 84, 268, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (707, 25, 269, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (708, 80, 269, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (709, 20, 269, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (710, 6, 270, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (711, 4, 270, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (712, 6, 270, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (713, 5, 271, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (714, 15, 271, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (715, 9, 271, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (716, 16, 272, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (717, 40, 272, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (718, 10, 272, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (719, 8, 273, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (720, 5, 273, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (721, 3, 274, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (722, 10, 274, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (723, 6, 274, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (724, 40, 275, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (725, 24, 275, 8);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (726, 20, 275, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (727, 25, 275, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (728, 25, 276, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (729, 15, 276, 20);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (730, 18, 276, 37);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (731, 6, 276, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (732, 2, 277, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (733, 10, 277, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (734, 60, 277, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (735, 15, 277, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (736, 30, 278, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (737, 15, 278, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (738, 8, 279, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (739, 10, 279, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (740, 30, 279, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (741, 50, 280, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (742, 30, 280, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (743, 3, 281, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (744, 8, 281, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (745, 9, 281, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (746, 14, 282, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (747, 20, 282, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (748, 10, 282, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (749, 40, 283, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (750, 25, 283, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (751, 20, 283, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (752, 50, 283, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (753, 2, 284, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (754, 15, 285, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (755, 24, 285, 66);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (756, 50, 286, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (757, 24, 286, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (758, 24, 286, 73);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (759, 10, 287, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (760, 10, 287, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (761, 10, 287, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (762, 50, 288, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (763, 10, 288, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (764, 5, 288, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (765, 15, 288, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (766, 15, 289, 12);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (767, 20, 289, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (768, 30, 289, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (769, 35, 289, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (770, 30, 290, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (771, 6, 290, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (772, 20, 290, 58);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (773, 21, 290, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (774, 9, 290, 73);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (775, 7, 291, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (776, 1, 291, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (777, 8, 292, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (778, 15, 292, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (779, 15, 292, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (780, 6, 292, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (781, 60, 293, 3);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (782, 40, 293, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (783, 30, 293, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (784, 35, 293, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (785, 35, 294, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (786, 4, 294, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (787, 36, 294, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (788, 9, 294, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (789, 15, 295, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (790, 24, 295, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (791, 30, 296, 12);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (792, 70, 296, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (793, 7, 297, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (794, 7, 297, 67);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (795, 10, 298, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (796, 10, 299, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (797, 30, 299, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (798, 40, 299, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (799, 24, 300, 32);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (800, 60, 300, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (801, 10, 301, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (802, 14, 301, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (803, 55, 302, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (804, 100, 302, 45);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (805, 48, 302, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (806, 8, 303, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (807, 10, 303, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (808, 6, 303, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (809, 10, 303, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (810, 40, 304, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (811, 20, 304, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (812, 40, 304, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (813, 18, 305, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (814, 30, 305, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (815, 15, 306, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (816, 14, 306, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (817, 24, 306, 22);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (818, 30, 306, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (819, 6, 306, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (820, 30, 307, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (821, 20, 307, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (822, 20, 307, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (823, 10, 307, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (824, 30, 308, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (825, 35, 308, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (826, 18, 308, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (827, 20, 308, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (828, 40, 308, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (829, 24, 309, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (830, 30, 310, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (831, 20, 310, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (832, 25, 311, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (833, 20, 311, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (834, 30, 311, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (835, 18, 311, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (836, 3, 311, 73);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (837, 12, 312, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (838, 18, 312, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (839, 20, 313, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (840, 15, 313, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (841, 10, 314, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (842, 50, 314, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (843, 20, 315, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (844, 10, 315, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (845, 25, 316, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (846, 70, 316, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (847, 16, 317, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (848, 6, 317, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (849, 25, 317, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (850, 25, 318, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (851, 18, 318, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (852, 35, 319, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (853, 18, 319, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (854, 10, 319, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (855, 60, 320, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (856, 3, 320, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (857, 40, 320, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (858, 5, 321, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (859, 35, 322, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (860, 30, 322, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (861, 15, 323, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (862, 60, 323, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (863, 11, 324, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (864, 28, 324, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (865, 12, 325, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (866, 10, 325, 32);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (867, 50, 325, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (868, 15, 325, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (869, 18, 326, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (870, 40, 326, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (871, 25, 326, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (872, 14, 327, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (873, 2, 327, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (874, 10, 327, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (875, 6, 327, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (876, 12, 328, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (877, 6, 328, 63);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (878, 30, 328, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (879, 10, 328, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (880, 10, 329, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (881, 20, 329, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (882, 21, 329, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (883, 10, 330, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (884, 20, 330, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (885, 18, 330, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (886, 20, 331, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (887, 6, 331, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (888, 10, 332, 15);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (889, 21, 332, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (890, 15, 333, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (891, 9, 333, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (892, 30, 333, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (893, 50, 334, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (894, 4, 335, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (895, 14, 335, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (896, 10, 336, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (897, 24, 336, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (898, 10, 336, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (899, 50, 337, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (900, 15, 338, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (901, 4, 339, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (902, 6, 340, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (903, 20, 340, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (904, 20, 340, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (905, 40, 341, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (906, 100, 341, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (907, 4, 342, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (908, 20, 343, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (909, 60, 343, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (910, 14, 344, 3);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (911, 10, 344, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (912, 50, 344, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (913, 25, 345, 15);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (914, 5, 345, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (915, 21, 346, 20);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (916, 20, 346, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (917, 4, 346, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (918, 24, 347, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (919, 30, 347, 58);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (920, 30, 348, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (921, 120, 348, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (922, 65, 348, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (923, 5, 349, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (924, 24, 349, 63);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (925, 30, 349, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (926, 35, 350, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (927, 20, 350, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (928, 12, 350, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (929, 50, 351, 27);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (930, 9, 351, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (931, 10, 352, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (932, 4, 353, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (933, 30, 353, 73);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (934, 60, 354, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (935, 35, 354, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (936, 5, 355, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (937, 48, 356, 22);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (938, 25, 356, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (939, 6, 357, 48);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (940, 10, 357, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (941, 30, 358, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (942, 20, 358, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (943, 70, 358, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (944, 15, 358, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (945, 20, 359, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (946, 20, 359, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (947, 10, 359, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (948, 45, 360, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (949, 100, 360, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (950, 14, 360, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (951, 42, 360, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (952, 12, 360, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (953, 28, 361, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (954, 3, 362, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (955, 10, 362, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (956, 6, 362, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (957, 21, 363, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (958, 6, 364, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (959, 10, 364, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (960, 15, 364, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (961, 70, 365, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (962, 55, 365, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (963, 18, 365, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (964, 40, 365, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (965, 80, 365, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (966, 8, 366, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (967, 40, 366, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (968, 14, 367, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (969, 8, 367, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (970, 5, 367, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (971, 5, 368, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (972, 15, 369, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (973, 14, 369, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (974, 15, 369, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (975, 15, 369, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (976, 30, 370, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (977, 70, 371, 6);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (978, 20, 371, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (979, 15, 371, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (980, 42, 372, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (981, 40, 372, 22);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (982, 5, 373, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (983, 5, 373, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (984, 5, 374, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (985, 10, 374, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (986, 20, 374, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (987, 15, 374, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (988, 20, 375, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (989, 18, 375, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (990, 21, 376, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (991, 15, 376, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (992, 25, 376, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (993, 3, 376, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (994, 30, 376, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (995, 10, 377, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (996, 6, 377, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (997, 10, 377, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (998, 3, 378, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (999, 5, 378, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1000, 10, 378, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1001, 12, 379, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1002, 20, 379, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1003, 20, 379, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1004, 15, 380, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1005, 35, 380, 73);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1006, 25, 381, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1007, 20, 382, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1008, 9, 382, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1009, 12, 383, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1010, 35, 383, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1011, 8, 384, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1012, 30, 385, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1013, 20, 385, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1014, 36, 386, 12);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1015, 13, 386, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1016, 35, 386, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1017, 80, 386, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1018, 35, 387, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1019, 50, 387, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1020, 15, 387, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1021, 2, 387, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1022, 10, 388, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1023, 15, 388, 5);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1024, 40, 388, 22);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1025, 25, 389, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1026, 6, 389, 58);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1027, 10, 390, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1028, 25, 390, 50);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1029, 60, 390, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1030, 20, 391, 45);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1031, 21, 391, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1032, 60, 391, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1033, 8, 392, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1034, 20, 393, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1035, 15, 393, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1036, 50, 394, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1037, 60, 394, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1038, 30, 395, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1039, 20, 395, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1040, 15, 396, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1041, 21, 396, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1042, 2, 396, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1043, 4, 397, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1044, 20, 397, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1045, 21, 397, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1046, 20, 398, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1047, 15, 398, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1048, 15, 399, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1049, 18, 399, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1050, 30, 399, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1051, 35, 399, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1052, 30, 400, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1053, 20, 400, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1054, 15, 401, 22);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1055, 15, 401, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1056, 20, 402, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1057, 15, 402, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1058, 30, 403, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1059, 25, 403, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1060, 30, 403, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1061, 12, 404, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1062, 20, 404, 22);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1063, 2, 405, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1064, 20, 405, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1065, 30, 406, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1066, 20, 406, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1067, 12, 407, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1068, 20, 407, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1069, 6, 407, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1070, 20, 408, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1071, 3, 409, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1072, 28, 409, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1073, 6, 409, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1074, 50, 410, 15);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1075, 24, 410, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1076, 45, 410, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1077, 10, 410, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1078, 45, 410, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1079, 30, 410, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1080, 60, 411, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1081, 70, 411, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1082, 55, 411, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1083, 70, 411, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1084, 20, 412, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1085, 24, 412, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1086, 40, 412, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1087, 21, 413, 20);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1088, 3, 414, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1089, 49, 414, 58);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1090, 10, 415, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1091, 30, 416, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1092, 30, 416, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1093, 20, 416, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1094, 24, 417, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1095, 12, 417, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1096, 15, 417, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1097, 20, 418, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1098, 1, 418, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1099, 10, 418, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1100, 36, 419, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1101, 10, 419, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1102, 45, 420, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1103, 14, 420, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1104, 8, 421, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1105, 4, 421, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1106, 15, 421, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1107, 30, 422, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1108, 32, 423, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1109, 60, 423, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1110, 25, 423, 67);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1111, 50, 423, 73);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1112, 25, 423, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1113, 10, 424, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1114, 10, 424, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1115, 12, 424, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1116, 15, 425, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1117, 12, 425, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1118, 3, 426, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1119, 6, 426, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1120, 6, 426, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1121, 5, 427, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1122, 30, 428, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1123, 10, 428, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1124, 30, 428, 58);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1125, 2, 429, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1126, 7, 429, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1127, 21, 429, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1128, 30, 430, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1129, 8, 430, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1130, 100, 431, 12);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1131, 30, 431, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1132, 120, 431, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1133, 30, 431, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1134, 12, 432, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1135, 50, 433, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1136, 20, 433, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1137, 40, 433, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1138, 30, 434, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1139, 12, 434, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1140, 28, 434, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1141, 30, 435, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1142, 4, 435, 66);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1143, 30, 435, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1144, 9, 436, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1145, 20, 437, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1146, 40, 437, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1147, 30, 437, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1148, 20, 438, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1149, 4, 438, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1150, 15, 438, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1151, 30, 439, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1152, 15, 439, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1153, 50, 440, 9);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1154, 10, 440, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1155, 6, 440, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1156, 18, 441, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1157, 60, 441, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1158, 14, 441, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1159, 35, 442, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1160, 20, 443, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1161, 30, 443, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1162, 30, 444, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1163, 40, 444, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1164, 40, 444, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1165, 24, 444, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1166, 48, 444, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1167, 20, 445, 63);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1168, 6, 446, 9);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1169, 60, 446, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1170, 30, 446, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1171, 15, 446, 73);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1172, 90, 447, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1173, 25, 447, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1174, 50, 447, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1175, 10, 448, 8);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1176, 4, 448, 12);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1177, 20, 448, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1178, 20, 449, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1179, 18, 449, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1180, 7, 450, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1181, 9, 450, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1182, 30, 450, 58);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1183, 30, 450, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1184, 15, 451, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1185, 8, 451, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1186, 12, 451, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1187, 65, 451, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1188, 8, 451, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1189, 12, 452, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1190, 5, 453, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1191, 12, 453, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1192, 40, 453, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1193, 60, 453, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1194, 42, 454, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1195, 20, 454, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1196, 35, 454, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1197, 6, 455, 3);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1198, 15, 455, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1199, 5, 456, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1200, 35, 456, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1201, 35, 456, 73);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1202, 6, 457, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1203, 35, 457, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1204, 24, 457, 48);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1205, 20, 458, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1206, 4, 458, 32);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1207, 20, 459, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1208, 24, 459, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1209, 8, 459, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1210, 21, 460, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1211, 40, 460, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1212, 28, 460, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1213, 4, 461, 5);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1214, 5, 461, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1215, 40, 462, 8);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1216, 28, 462, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1217, 10, 462, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1218, 5, 463, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1219, 5, 463, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1220, 12, 464, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1221, 42, 464, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1222, 120, 464, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1223, 3, 465, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1224, 30, 465, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1225, 18, 466, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1226, 30, 466, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1227, 110, 466, 45);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1228, 24, 466, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1229, 30, 467, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1230, 27, 467, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1231, 50, 467, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1232, 18, 467, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1233, 12, 467, 58);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1234, 21, 468, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1235, 30, 468, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1236, 5, 469, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1237, 7, 469, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1238, 10, 469, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1239, 32, 470, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1240, 15, 470, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1241, 25, 470, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1242, 36, 471, 12);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1243, 20, 471, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1244, 40, 471, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1245, 20, 471, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1246, 12, 472, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1247, 3, 472, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1248, 40, 472, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1249, 21, 473, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1250, 8, 473, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1251, 50, 474, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1252, 3, 475, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1253, 50, 475, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1254, 45, 475, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1255, 42, 475, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1256, 15, 476, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1257, 16, 477, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1258, 5, 477, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1259, 12, 478, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1260, 4, 478, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1261, 6, 478, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1262, 25, 479, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1263, 5, 479, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1264, 20, 480, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1265, 10, 480, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1266, 10, 480, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1267, 15, 481, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1268, 6, 481, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1269, 12, 481, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1270, 15, 481, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1271, 50, 482, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1272, 30, 482, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1273, 40, 482, 50);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1274, 15, 483, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1275, 3, 483, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1276, 10, 483, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1277, 40, 484, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1278, 30, 484, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1279, 20, 485, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1280, 16, 486, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1281, 20, 486, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1282, 25, 486, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1283, 30, 487, 6);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1284, 15, 487, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1285, 20, 487, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1286, 20, 488, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1287, 2, 488, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1288, 40, 489, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1289, 20, 489, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1290, 4, 490, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1291, 12, 490, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1292, 3, 491, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1293, 6, 492, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1294, 18, 492, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1295, 5, 493, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1296, 35, 493, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1297, 40, 493, 45);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1298, 14, 493, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1299, 15, 494, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1300, 20, 495, 3);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1301, 50, 495, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1302, 35, 495, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1303, 28, 496, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1304, 50, 497, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1305, 24, 498, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1306, 16, 498, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1307, 45, 498, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1308, 7, 498, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1309, 6, 499, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1310, 28, 499, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1311, 9, 499, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1312, 40, 499, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1313, 8, 500, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1314, 35, 500, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1315, 9, 500, 63);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1316, 30, 500, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1317, 44, 501, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1318, 40, 501, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1319, 28, 501, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1320, 15, 502, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1321, 6, 502, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1322, 10, 502, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1323, 5, 503, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1324, 40, 503, 45);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1325, 25, 503, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1326, 12, 504, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1327, 30, 504, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1328, 20, 504, 50);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1329, 15, 504, 73);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1330, 8, 505, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1331, 3, 505, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1332, 4, 506, 45);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1333, 5, 506, 74);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1334, 3, 507, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1335, 30, 508, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1336, 30, 508, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1337, 14, 508, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1338, 25, 508, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1339, 21, 509, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1340, 20, 509, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1341, 6, 509, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1342, 20, 509, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1343, 30, 510, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1344, 7, 510, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1345, 30, 510, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1346, 24, 510, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1347, 20, 511, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1348, 60, 511, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1349, 40, 511, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1350, 10, 512, 32);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1351, 12, 513, 25);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1352, 40, 513, 27);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1353, 30, 513, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1354, 35, 514, 25);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1355, 18, 514, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1356, 16, 515, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1357, 30, 515, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1358, 28, 515, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1359, 60, 515, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1360, 40, 516, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1361, 6, 516, 22);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1362, 20, 516, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1363, 20, 517, 3);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1364, 130, 517, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1365, 80, 518, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1366, 40, 519, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1367, 35, 519, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1368, 40, 519, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1369, 2, 520, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1370, 4, 521, 22);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1371, 50, 521, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1372, 15, 521, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1373, 12, 521, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1374, 30, 522, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1375, 15, 522, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1376, 20, 522, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1377, 15, 522, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1378, 15, 523, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1379, 16, 524, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1380, 18, 525, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1381, 25, 525, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1382, 33, 526, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1383, 70, 526, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1384, 7, 526, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1385, 2, 527, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1386, 50, 527, 66);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1387, 6, 528, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1388, 3, 528, 67);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1389, 16, 529, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1390, 12, 529, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1391, 27, 529, 45);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1392, 120, 529, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1393, 20, 530, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1394, 10, 531, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1395, 20, 532, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1396, 20, 532, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1397, 35, 533, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1398, 15, 533, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1399, 3, 534, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1400, 20, 534, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1401, 35, 534, 74);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1402, 1, 535, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1403, 10, 536, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1404, 5, 536, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1405, 30, 537, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1406, 2, 537, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1407, 30, 537, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1408, 10, 538, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1409, 10, 538, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1410, 30, 539, 8);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1411, 15, 539, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1412, 42, 539, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1413, 15, 540, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1414, 20, 540, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1415, 50, 541, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1416, 40, 541, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1417, 30, 542, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1418, 15, 542, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1419, 30, 542, 63);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1420, 18, 542, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1421, 3, 543, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1422, 20, 543, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1423, 14, 544, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1424, 20, 544, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1425, 10, 545, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1426, 3, 545, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1427, 15, 545, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1428, 14, 546, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1429, 8, 546, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1430, 15, 547, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1431, 6, 547, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1432, 65, 548, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1433, 35, 548, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1434, 21, 549, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1435, 10, 549, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1436, 35, 549, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1437, 24, 549, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1438, 20, 550, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1439, 2, 551, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1440, 10, 551, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1441, 20, 552, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1442, 20, 552, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1443, 25, 552, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1444, 50, 553, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1445, 10, 553, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1446, 7, 553, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1447, 40, 554, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1448, 20, 554, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1449, 25, 555, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1450, 30, 555, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1451, 60, 555, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1452, 5, 555, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1453, 24, 556, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1454, 15, 556, 25);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1455, 15, 556, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1456, 36, 557, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1457, 24, 557, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1458, 4, 557, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1459, 10, 558, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1460, 10, 558, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1461, 20, 559, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1462, 2, 559, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1463, 15, 559, 74);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1464, 1, 560, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1465, 20, 561, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1466, 50, 561, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1467, 20, 562, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1468, 7, 563, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1469, 5, 563, 25);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1470, 5, 563, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1471, 15, 564, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1472, 18, 564, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1473, 30, 564, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1474, 16, 565, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1475, 40, 565, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1476, 20, 565, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1477, 12, 566, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1478, 35, 566, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1479, 20, 567, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1480, 20, 567, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1481, 8, 567, 48);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1482, 30, 567, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1483, 16, 568, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1484, 30, 569, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1485, 20, 569, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1486, 40, 570, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1487, 30, 570, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1488, 60, 570, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1489, 25, 570, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1490, 20, 571, 32);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1491, 20, 571, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1492, 7, 572, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1493, 20, 572, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1494, 30, 573, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1495, 20, 574, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1496, 6, 574, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1497, 3, 575, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1498, 6, 575, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1499, 20, 576, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1500, 15, 576, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1501, 40, 576, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1502, 15, 576, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1503, 12, 577, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1504, 9, 577, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1505, 12, 578, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1506, 20, 578, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1507, 35, 579, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1508, 15, 579, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1509, 15, 580, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1510, 21, 580, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1511, 5, 581, 20);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1512, 2, 581, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1513, 10, 582, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1514, 20, 582, 8);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1515, 10, 582, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1516, 21, 582, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1517, 6, 583, 6);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1518, 28, 583, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1519, 30, 583, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1520, 24, 583, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1521, 2, 584, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1522, 8, 584, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1523, 8, 584, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1524, 9, 584, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1525, 3, 585, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1526, 10, 585, 25);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1527, 16, 585, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1528, 3, 585, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1529, 20, 586, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1530, 9, 586, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1531, 9, 586, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1532, 8, 587, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1533, 20, 587, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1534, 15, 588, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1535, 2, 588, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1536, 52, 589, 22);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1537, 6, 589, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1538, 24, 589, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1539, 60, 589, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1540, 30, 589, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1541, 6, 590, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1542, 25, 590, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1543, 40, 590, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1544, 21, 590, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1545, 4, 591, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1546, 25, 591, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1547, 50, 591, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1548, 30, 592, 58);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1549, 15, 592, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1550, 6, 593, 25);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1551, 10, 593, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1552, 16, 594, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1553, 30, 594, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1554, 50, 594, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1555, 15, 594, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1556, 15, 595, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1557, 5, 595, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1558, 20, 595, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1559, 12, 595, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1560, 4, 596, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1561, 35, 597, 22);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1562, 70, 598, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1563, 25, 598, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1564, 42, 598, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1565, 60, 598, 58);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1566, 48, 598, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1567, 21, 599, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1568, 30, 599, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1569, 20, 599, 74);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1570, 80, 600, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1571, 12, 600, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1572, 60, 600, 37);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1573, 36, 600, 45);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1574, 45, 600, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1575, 55, 600, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1576, 30, 601, 5);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1577, 3, 601, 9);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1578, 49, 602, 3);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1579, 18, 602, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1580, 20, 603, 25);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1581, 4, 603, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1582, 30, 603, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1583, 5, 604, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1584, 10, 604, 25);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1585, 10, 604, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1586, 42, 604, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1587, 15, 605, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1588, 6, 605, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1589, 50, 605, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1590, 10, 606, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1591, 100, 607, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1592, 65, 607, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1593, 50, 608, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1594, 14, 608, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1595, 24, 608, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1596, 15, 608, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1597, 20, 609, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1598, 20, 609, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1599, 30, 610, 3);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1600, 35, 610, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1601, 10, 610, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1602, 5, 611, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1603, 10, 611, 27);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1604, 4, 611, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1605, 40, 612, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1606, 35, 612, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1607, 30, 612, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1608, 3, 613, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1609, 20, 613, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1610, 42, 614, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1611, 20, 614, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1612, 40, 614, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1613, 35, 614, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1614, 3, 614, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1615, 25, 615, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1616, 8, 615, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1617, 20, 616, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1618, 12, 616, 58);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1619, 4, 617, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1620, 15, 617, 67);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1621, 60, 618, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1622, 80, 618, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1623, 21, 619, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1624, 6, 619, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1625, 40, 619, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1626, 3, 620, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1627, 20, 621, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1628, 30, 621, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1629, 42, 621, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1630, 40, 622, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1631, 10, 622, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1632, 50, 622, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1633, 20, 622, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1634, 3, 623, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1635, 2, 623, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1636, 50, 624, 6);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1637, 12, 624, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1638, 16, 624, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1639, 10, 625, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1640, 20, 625, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1641, 15, 625, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1642, 21, 625, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1643, 20, 626, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1644, 3, 626, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1645, 10, 627, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1646, 25, 628, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1647, 21, 628, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1648, 15, 628, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1649, 21, 629, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1650, 20, 629, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1651, 30, 630, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1652, 25, 630, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1653, 20, 631, 20);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1654, 12, 632, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1655, 10, 632, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1656, 10, 632, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1657, 30, 633, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1658, 30, 633, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1659, 50, 633, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1660, 10, 634, 73);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1661, 25, 635, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1662, 20, 635, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1663, 32, 635, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1664, 8, 636, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1665, 40, 637, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1666, 21, 637, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1667, 12, 637, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1668, 20, 638, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1669, 12, 638, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1670, 30, 638, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1671, 25, 638, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1672, 70, 639, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1673, 35, 639, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1674, 40, 639, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1675, 5, 640, 25);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1676, 20, 641, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1677, 18, 641, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1678, 40, 642, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1679, 40, 642, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1680, 15, 643, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1681, 10, 643, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1682, 14, 643, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1683, 15, 644, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1684, 40, 645, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1685, 30, 646, 8);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1686, 10, 646, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1687, 24, 646, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1688, 35, 646, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1689, 20, 646, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1690, 28, 647, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1691, 50, 647, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1692, 120, 647, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1693, 110, 648, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1694, 45, 648, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1695, 91, 648, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1696, 100, 648, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1697, 15, 649, 45);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1698, 16, 649, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1699, 80, 650, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1700, 36, 650, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1701, 5, 651, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1702, 8, 652, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1703, 3, 653, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1704, 30, 654, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1705, 30, 654, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1706, 30, 655, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1707, 6, 655, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1708, 40, 656, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1709, 21, 656, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1710, 20, 656, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1711, 15, 657, 58);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1712, 35, 657, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1713, 20, 658, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1714, 15, 659, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1715, 14, 660, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1716, 20, 661, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1717, 14, 661, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1718, 12, 662, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1719, 15, 662, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1720, 5, 662, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1721, 12, 663, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1722, 10, 663, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1723, 5, 663, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1724, 10, 664, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1725, 12, 664, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1726, 15, 664, 67);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1727, 40, 665, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1728, 60, 665, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1729, 30, 666, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1730, 40, 666, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1731, 15, 666, 58);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1732, 25, 667, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1733, 10, 668, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1734, 30, 668, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1735, 10, 668, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1736, 6, 669, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1737, 6, 669, 32);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1738, 20, 669, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1739, 1, 670, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1740, 10, 670, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1741, 60, 671, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1742, 25, 671, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1743, 24, 672, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1744, 24, 672, 25);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1745, 20, 672, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1746, 24, 673, 50);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1747, 10, 674, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1748, 40, 674, 63);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1749, 15, 675, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1750, 35, 675, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1751, 10, 676, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1752, 10, 676, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1753, 24, 676, 67);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1754, 20, 677, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1755, 30, 677, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1756, 6, 677, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1757, 25, 678, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1758, 12, 678, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1759, 2, 679, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1760, 10, 679, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1761, 7, 679, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1762, 10, 679, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1763, 5, 680, 20);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1764, 5, 680, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1765, 20, 680, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1766, 5, 681, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1767, 5, 681, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1768, 60, 682, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1769, 49, 682, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1770, 15, 682, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1771, 36, 683, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1772, 25, 683, 27);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1773, 25, 683, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1774, 30, 683, 58);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1775, 42, 684, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1776, 30, 684, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1777, 30, 685, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1778, 14, 685, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1779, 16, 685, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1780, 20, 685, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1781, 2, 686, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1782, 30, 686, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1783, 20, 687, 6);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1784, 21, 688, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1785, 4, 688, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1786, 8, 688, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1787, 30, 689, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1788, 8, 690, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1789, 20, 690, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1790, 20, 691, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1791, 24, 691, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1792, 49, 691, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1793, 35, 691, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1794, 10, 692, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1795, 40, 692, 67);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1796, 8, 693, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1797, 20, 693, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1798, 44, 694, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1799, 30, 694, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1800, 80, 694, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1801, 50, 694, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1802, 28, 695, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1803, 15, 696, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1804, 21, 696, 22);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1805, 15, 696, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1806, 5, 697, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1807, 18, 697, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1808, 18, 697, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1809, 20, 698, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1810, 10, 698, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1811, 25, 699, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1812, 25, 699, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1813, 40, 699, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1814, 4, 700, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1815, 9, 701, 50);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1816, 40, 701, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1817, 4, 701, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1818, 12, 702, 6);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1819, 30, 702, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1820, 6, 702, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1821, 60, 702, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1822, 5, 703, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1823, 15, 704, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1824, 6, 704, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1825, 50, 704, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1826, 16, 705, 6);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1827, 2, 705, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1828, 50, 706, 20);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1829, 50, 706, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1830, 28, 707, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1831, 25, 707, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1832, 30, 707, 45);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1833, 24, 707, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1834, 12, 708, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1835, 12, 709, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1836, 14, 709, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1837, 8, 709, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1838, 30, 710, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1839, 40, 710, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1840, 8, 710, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1841, 20, 711, 5);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1842, 6, 711, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1843, 5, 711, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1844, 20, 712, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1845, 10, 713, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1846, 24, 713, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1847, 6, 714, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1848, 60, 714, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1849, 45, 715, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1850, 77, 715, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1851, 20, 715, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1852, 9, 715, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1853, 44, 715, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1854, 2, 716, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1855, 6, 717, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1856, 5, 717, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1857, 10, 717, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1858, 16, 718, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1859, 8, 719, 37);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1860, 12, 719, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1861, 12, 719, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1862, 12, 720, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1863, 40, 720, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1864, 30, 721, 12);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1865, 30, 721, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1866, 4, 721, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1867, 9, 722, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1868, 40, 723, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1869, 14, 724, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1870, 6, 725, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1871, 7, 725, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1872, 5, 726, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1873, 6, 726, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1874, 10, 726, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1875, 10, 727, 63);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1876, 16, 728, 8);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1877, 10, 728, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1878, 20, 729, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1879, 30, 730, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1880, 30, 730, 47);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1881, 10, 730, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1882, 20, 730, 63);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1883, 20, 731, 8);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1884, 40, 731, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1885, 10, 731, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1886, 6, 731, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1887, 18, 732, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1888, 20, 732, 12);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1889, 80, 732, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1890, 30, 732, 27);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1891, 24, 732, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1892, 35, 732, 63);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1893, 40, 733, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1894, 60, 734, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1895, 20, 735, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1896, 9, 735, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1897, 84, 736, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1898, 15, 736, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1899, 55, 737, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1900, 20, 737, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1901, 40, 737, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1902, 36, 738, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1903, 8, 738, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1904, 35, 738, 32);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1905, 30, 739, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1906, 15, 739, 20);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1907, 10, 739, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1908, 15, 739, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1909, 60, 740, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1910, 6, 740, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1911, 20, 740, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1912, 60, 741, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1913, 40, 741, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1914, 40, 742, 6);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1915, 15, 742, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1916, 4, 742, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1917, 65, 743, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1918, 60, 743, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1919, 65, 743, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1920, 66, 743, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1921, 50, 744, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1922, 20, 744, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1923, 90, 744, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1924, 2, 745, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1925, 50, 746, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1926, 35, 746, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1927, 18, 747, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1928, 20, 748, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1929, 4, 748, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1930, 40, 749, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1931, 50, 750, 32);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1932, 20, 750, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1933, 20, 750, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1934, 12, 751, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1935, 7, 751, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1936, 20, 751, 74);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1937, 30, 751, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1938, 20, 752, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1939, 15, 752, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1940, 21, 752, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1941, 25, 753, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1942, 30, 753, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1943, 30, 753, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1944, 60, 754, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1945, 25, 754, 22);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1946, 25, 754, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1947, 6, 754, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1948, 56, 755, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1949, 15, 755, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1950, 24, 755, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1951, 40, 755, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1952, 4, 756, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1953, 10, 756, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1954, 10, 756, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1955, 6, 757, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1956, 6, 757, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1957, 2, 758, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1958, 10, 758, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1959, 8, 759, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1960, 2, 759, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1961, 30, 760, 8);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1962, 10, 760, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1963, 14, 760, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1964, 70, 761, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1965, 90, 761, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1966, 21, 761, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1967, 12, 762, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1968, 18, 762, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1969, 9, 762, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1970, 20, 763, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1971, 10, 763, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1972, 40, 764, 58);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1973, 20, 764, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1974, 50, 765, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1975, 36, 765, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1976, 60, 765, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1977, 10, 766, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1978, 4, 766, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1979, 20, 766, 45);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1980, 2, 766, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1981, 28, 767, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1982, 15, 768, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1983, 18, 768, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1984, 15, 769, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1985, 16, 769, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1986, 25, 770, 3);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1987, 110, 770, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1988, 30, 770, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1989, 20, 771, 12);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1990, 10, 771, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1991, 5, 771, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1992, 3, 772, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1993, 2, 772, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1994, 24, 773, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1995, 11, 774, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1996, 15, 774, 20);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1997, 63, 774, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1998, 44, 774, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (1999, 35, 774, 72);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2000, 35, 775, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2001, 30, 775, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2002, 4, 776, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2003, 30, 776, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2004, 12, 777, 26);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2005, 30, 777, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2006, 21, 777, 65);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2007, 50, 777, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2008, 10, 778, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2009, 20, 778, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2010, 8, 779, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2011, 10, 779, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2012, 30, 780, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2013, 21, 780, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2014, 35, 781, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2015, 24, 781, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2016, 20, 782, 56);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2017, 12, 782, 63);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2018, 100, 783, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2019, 70, 783, 5);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2020, 60, 783, 29);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2021, 100, 783, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2022, 45, 784, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2023, 80, 784, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2024, 21, 784, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2025, 20, 784, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2026, 16, 784, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2027, 35, 785, 36);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2028, 25, 785, 38);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2029, 30, 785, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2030, 70, 786, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2031, 36, 786, 69);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2032, 15, 787, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2033, 12, 787, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2034, 6, 787, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2035, 10, 788, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2036, 60, 788, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2037, 30, 788, 42);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2038, 10, 788, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2039, 7, 789, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2040, 30, 789, 59);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2041, 4, 790, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2042, 5, 791, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2043, 2, 791, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2044, 30, 791, 71);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2045, 20, 792, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2046, 24, 792, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2047, 60, 792, 49);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2048, 28, 792, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2049, 20, 793, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2050, 30, 794, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2051, 30, 794, 63);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2052, 15, 795, 44);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2053, 4, 795, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2054, 10, 796, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2055, 12, 797, 62);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2056, 15, 798, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2057, 24, 798, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2058, 20, 799, 12);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2059, 15, 799, 32);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2060, 18, 799, 35);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2061, 25, 800, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2062, 30, 800, 5);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2063, 42, 801, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2064, 10, 802, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2065, 4, 802, 12);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2066, 50, 803, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2067, 10, 804, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2068, 30, 805, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2069, 10, 805, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2070, 35, 806, 18);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2071, 20, 806, 32);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2072, 25, 806, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2073, 10, 807, 33);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2074, 20, 807, 67);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2075, 15, 808, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2076, 15, 808, 25);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2077, 20, 808, 51);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2078, 20, 808, 57);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2079, 40, 809, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2080, 35, 809, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2081, 50, 809, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2082, 3, 810, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2083, 3, 811, 21);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2084, 21, 811, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2085, 4, 811, 61);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2086, 30, 812, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2087, 12, 812, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2088, 35, 812, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2089, 4, 813, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2090, 10, 813, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2091, 15, 814, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2092, 10, 815, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2093, 12, 815, 70);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2094, 30, 816, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2095, 40, 816, 40);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2096, 30, 816, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2097, 77, 817, 17);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2098, 12, 817, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2099, 25, 817, 53);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2100, 4, 817, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2101, 55, 817, 68);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2102, 4, 818, 30);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2103, 20, 818, 54);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2104, 3, 819, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2105, 42, 819, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2106, 35, 819, 34);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2107, 9, 820, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2108, 8, 821, 28);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2109, 36, 821, 43);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2110, 28, 821, 77);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2111, 20, 822, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2112, 40, 823, 1);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2113, 20, 823, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2114, 30, 823, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2115, 20, 823, 31);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2116, 15, 824, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2117, 10, 824, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2118, 8, 825, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2119, 40, 825, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2120, 22, 825, 50);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2121, 130, 825, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2122, 10, 826, 11);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2123, 20, 826, 24);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2124, 14, 827, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2125, 10, 828, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2126, 30, 828, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2127, 2, 828, 76);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2128, 20, 829, 6);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2129, 20, 829, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2130, 10, 829, 19);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2131, 24, 830, 2);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2132, 4, 830, 3);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2133, 1, 830, 4);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2134, 1, 830, 6);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2135, 1, 830, 7);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2136, 2, 830, 8);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2137, 1, 830, 10);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2138, 2, 830, 12);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2139, 4, 830, 13);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2140, 1, 830, 14);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2141, 2, 830, 16);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2142, 1, 830, 20);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2143, 2, 830, 23);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2144, 1, 830, 32);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2145, 2, 830, 39);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2146, 3, 830, 41);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2147, 3, 830, 46);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2148, 2, 830, 52);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2149, 2, 830, 55);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2150, 2, 830, 60);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2151, 2, 830, 64);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2152, 1, 830, 66);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2153, 2, 830, 73);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2154, 4, 830, 75);
INSERT
  INTO OrderDetails (ID, Quantity, OrderID, ProductID)
  VALUES (2155, 2, 830, 77);
\! echo "";
\! echo "Done inserting records into OrderDetails tables🎉";
