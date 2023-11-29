--Project Phases and Tasks:
--Phase 1: Database Design (DDL)
--Task 1: Define the Database Schema
--Description: Create the database schema for the library management system, defining tables and relationships

--Creat Authors table
CREATE TABLE Authors (
    AuthorID INT IDENTITY(1001,1) PRIMARY KEY,
    AuthorName NVARCHAR(255) NOT NULL
);
-- Verify the inserted data
SELECT * FROM Authors;

--Creat Genres table
CREATE TABLE Genres (
    GenreID INT IDENTITY(1,1) PRIMARY KEY,
    GenreName VARCHAR(255) NOT NULL
);
-- Verify the inserted data
SELECT * FROM Genres

-- Create Books table 
CREATE TABLE Books (
    BookId INT IDENTITY(3001, 1) PRIMARY KEY,
    BookTitle NVARCHAR(255) NOT NULL,
    AuthorId INT FOREIGN KEY REFERENCES Authors(AuthorId),
    ISBN NVARCHAR(MAX) NOT NULL,
    PublishedDate DATE,
    GenreName NVARCHAR(255) NOT NULL
);
-- Verify the inserted data
SELECT * FROM Books

-- Create the Users table
CREATE TABLE Users (
    UserID INT IDENTITY(101,1) PRIMARY KEY,
    UserName VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(255)
);
-- Verify the inserted data
SELECT * FROM Users

-- Create the Loans table to track book loans
CREATE TABLE Loans (
    LoanID INT IDENTITY(201,1) PRIMARY KEY,
    BookID INT,
    UserID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
-- Verify the inserted data
SELECT * FROM Loans

--------------------------------------------------------------------------------------------------------------
--Task 2: Specify Keys and Constraints
--Description: Define primary keys, foreign keys, constraints, and relationships between tables.

DROP TABLE Books 

-- Drop the foreign key constraint
ALTER TABLE Books
DROP CONSTRAINT FK__Books__AuthorId__3B75D760; -- Replace 'FK_AuthorID' with the actual name of your foreign key constraint

-- Drop the foreign key constraint in 'Loans' table
ALTER TABLE Loans
DROP CONSTRAINT FK__Loans__BookID__403A8C7D;  -- Replace 'FK_BookID' with the actual name of your foreign key constraint

-- Create the Books table
CREATE TABLE Books (
    BookId INT IDENTITY(3001, 1) PRIMARY KEY,
    BookTitle NVARCHAR(255) NOT NULL,
    AuthorId INT FOREIGN KEY REFERENCES Authors(AuthorId),
    ISBN NVARCHAR(MAX) NOT NULL,
    PublishedDate DATE,
    GenreName VARCHAR(255) NOT NULL, 
    GenreId INT NOT NULL, -- Assuming GenreId is the foreign key column
    CONSTRAINT FK_AuthorID FOREIGN KEY (AuthorId) REFERENCES Authors(AuthorId),
    CONSTRAINT FK_GenreID FOREIGN KEY (GenreId) REFERENCES Genres(GenreID)
);

SELECT * FROM Books 

DROP TABLE Loans 

-- Create the Loans table to track book loans
CREATE TABLE Loans (
    LoanID INT IDENTITY(201,1) PRIMARY KEY,
    BookID INT,
    UserID INT,
    LoanDate DATE,
    ReturnDate DATE,
    CONSTRAINT FK_BookID FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT FK_UserID FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

SELECT * FROM Loans
----------------------------------------------------------------------------------------------------

--Phase 2: Data Population (DML)
--Task 3: Populate the Database with Sample Data
--Description: Insert sample data into the database, including books, user information, and Loans.

-- Insert authors in alphabetical order
INSERT INTO Authors (AuthorName) VALUES
('Agatha Christie'),
('Dale Carnegie'),
('Danielle Steel'),
('Dan Brown'),
('David Baldacci'),
('Dean Koontz'),
('Eckhart Tolle'),
('Eoin Colfer'),
('George R.R. Martin'),
('Giada De Laurentiis'),
('Gordon Ramsay'),
('Harlan Coben'),
('Ina Garten'),
('James Patterson'), 
('J.K. Rowling'),
('J.R.R. Tolkien'),
('Jamie Oliver'),
('Janet Evanovich'),
('Jodi Picoult'),
('John C. Maxwell'),
('John Green'),
('Lee Child'),
('Martha Stewart'),
('Michael Connelly'),
('Mitch Albom'),
('Nigella Lawson'),
('Nicholas Sparks'),
('Nora Roberts'),
('Paolo Coelho'),
('Paul Hollywood'),
('Rick Riordan'),
('Stephen King'),
('Suzanne Collins'),
('Thomas Keller'),
('Tom Clancy');

--Verify the inserted data
SELECT * FROM Authors 

-- Assuming the Genres table has columns GenreID (auto-increment) and GenreName
-- Make sure to adjust column names if needed

-- Insert genres into the table
INSERT INTO Genres (GenreName) VALUES
('Adventure'),
('Auto-Biography'),
('Baking'),
('Biography'),
('Business'),
('Childrens Comedy'),
('Childrens Picture Book'),
('Christmas'),
('Communication'),
('Cooking'),
('Crafts'),
('Crime'),
('Dystopian'),
('Entertaining'),
('Fantasy'),
('Fiction'),
('Gardening'),
('Healthy Eating'),
('Leadership'),
('Lifestyle'),
('Music'),
('Mystery'),
('Mythology'),
('Personal Development'),
('Relationships'),
('Science Fiction'),
('Self-Help'),
('Spirituality'),
('Teamwork'),
('Thriller'),
('Young Adult');

--Verify inserted data
SELECT * FROM Genres 

-- Assuming Books table structure:
-- Inserting data into the Books table
INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID) VALUES
('The Hobbit', 1016, '978-0-395-07430-5', '1937-09-21','Fantasy', 15 ),
('Fellowship of the Ring', 1016, '978-0-395-13524-5', '1954-07-29', 'Fantasy', 15),
('The Two Towers', 1016, '978-0-395-13525-2', '1954-11-11', 'Fantasy', 15),
('The Return of the King', 1016, '978-0-395-13526-9', '1955-10-20', 'Fantasy', 15),
('The Silmarillion', 1016, '978-0-395-25730-2', '1977-09-15', 'Fantasy', 15),
('Unfinished Tales', 1016, '978-0-395-35439-0', '1980-09-24', 'Fantasy', 15),
('The Book of Lost Tales, Part I', 1016, '978-0-395-35439-0', '1983-10-01', 'Fantasy', 15),
('The Book of Lost Tales, Part II', 1016, '978-0-395-36614-0', '1984-11-01', 'Fantasy', 15),
('The Lays of Beleriand', 1016, '978-0-395-52217-6', '1985-07-01', 'Fantasy', 15),
('The Shaping of Middle-earth', 1016, '978-0-395-55616-0', '1986-10-01', 'Fantasy', 15),
('The Lost Road and Other Writings', 1016, '978-0-395-61160-9', '1987-10-01', 'Fantasy', 15),
('The Hobbit (Illustrated Edition)', 1016, '978-0-395-36614-0', '1991-01-01', 'Fantasy,', 15),
('The Treason of Isengard', 1016, '978-0-395-59827-8', '1989-09-01', 'Fantasy', 15),
('The War of the Ring', 1016, '978-0-395-59830-8', '1990-10-01', 'Fantasy', 15),
('Sauron Defeated', 1016, '978-0-395-59831-5', '1992-10-01', 'Fantasy', 15),
('Morgoth''s Ring', 1016, '978-0-395-74540-9', '1993-10-01', 'Fantasy', 15),
('The War of the Jewels', 1016, '978-0-395-71050-7', '1994-10-01', 'Fantasy', 15),
('The Peoples of Middle-earth', 1016, '978-0-395-82760-4', '1996-09-01', 'Fantasy', 15);

-- Inserting data into the Books table
INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID) VALUES
('Carrie', 1032, '978-0-385-08695-0', '1974-04-05', 'Horror', 32),
('Salem''s Lot', 1032, '978-0-385-00851-0', '1975-10-17', 'Horror', 32),
('The Shining', 1032, '978-0-385-12167-5', '1977-01-28', 'Horror', 32),
('The Stand', 1032, '978-0-385-12168-2', '1978-10-03', 'Horror', 32),
('The Dead Zone', 1032, '978-0-670-81210-8', '1979-08-30', 'Horror', 32),
('Firestarter', 1032, '978-0-670-30254-8', '1980-09-29', 'Horror', 32),
('Cujo', 1032, '978-0-670-81325-9', '1981-09-08', 'Horror', 32),
('It', 1032, '978-0-670-81302-0', '1986-09-15', 'Horror', 32),
('The Dark Tower: The Gunslinger', 1032, '978-0-452-01249-5', '1982-06-10', 'Fantasy', 15),
('Misery', 1032, '978-0-670-81364-8', '1987-06-08', 'Thriller', 30),
('The Tommyknockers', 1032, '978-0-399-13366-2', '1987-11-10', 'Horror', 32),
('The Green Mile', 1032, '978-0-451-19205-2', '1996-03-28', 'Fiction', 16),
('Bag of Bones', 1032, '978-0-684-85350-5', '1998-09-22', 'Horror', 32),
('Hearts in Atlantis', 1032, '978-0-684-86346-7', '1999-09-14', 'Fiction', 16),
('Dreamcatcher', 1032, '978-0-7432-0196-1', '2001-03-20', 'Horror', 32),
('Doctor Sleep', 1032, '978-1-4516-3348-1', '2013-09-24', 'Horror', 32),
('The Outsider', 1032, '978-1-5011-8098-2', '2018-05-22', 'Mystery', 22),
('The Institute', 1032, '978-1-9821-2365-0', '2019-09-10', 'Horror', 32),
('If It Bleeds', 1032, '978-1-9821-8552-4', '2020-04-21', 'Horror', 32);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID) VALUES
('Harry Potter and the Sorcerer''s Stone', 1015, '978-0-590-35340-3', '1998-09-01', 'Fantasy', 15),
('Harry Potter and the Chamber of Secrets', 1015, '978-0-439-06487-3', '1999-06-02', 'Fantasy', 15),
('Harry Potter and the Prisoner of Azkaban', 1015, '978-0-439-13635-8', '1999-09-08', 'Fantasy', 15),
('Harry Potter and the Goblet of Fire', 1015, '978-0-439-13959-2', '2000-07-08', 'Fantasy', 15),
('Harry Potter and the Order of the Phoenix', 1015, '978-0-439-35806-1', '2003-06-21', 'Fantasy', 15),
('Harry Potter and the Half-Blood Prince', 1015, '978-0-439-78454-2', '2005-07-16', 'Fantasy', 15),
('Harry Potter and the Deathly Hallows', 1015, '978-0-545-01022-1', '2007-07-21', 'Fantasy', 15),
('The Casual Vacancy', 1015, '978-0-316-22854-9', '2012-09-27', 'Fiction', 16),
('The Cuckoo''s Calling (as Robert Galbraith)', 1015, '978-0-316-20684-6', '2013-04-30', 'Crime', 12),
('The Silkworm (as Robert Galbraith)', 1015, '978-0-316-20686-0', '2014-06-19', 'Crime', 12),
('Career of Evil (as Robert Galbraith)', 1015, '978-0-316-20692-1', '2015-10-20', 'Crime', 12),
('Lethal White (as Robert Galbraith)', 1015, '978-0-316-55491-3', '2018-09-18', 'Crime', 12),
('Troubled Blood (as Robert Galbraith)', 1015, '978-0-316-48841-4', '2020-09-15', 'Crime', 12);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID) VALUES
('Along Came a Spider', 1014, '978-0-446-60409-3', '1993-10-01', 'Thriller', 30),
('Kiss the Girls', 1014, '978-0-446-51803-9', '1995-08-01', 'Thriller', 30),
('Jack & Jill', 1014, '978-0-446-51471-0', '1996-11-01', 'Thriller', 30),
('Cat & Mouse', 1014, '978-0-446-52046-9', '1997-11-01', 'Thriller', 30),
('Pop Goes the Weasel', 1014, '978-0-446-52656-0', '1999-11-17', 'Thriller', 30),
('Roses Are Red', 1014, '978-0-446-52545-7', '2000-11-20', 'Thriller', 30),
('Violets Are Blue', 1014, '978-0-316-69390-7', '2001-11-19', 'Thriller', 30),
('Four Blind Mice', 1014, '978-0-316-15555-6', '2002-11-18', 'Thriller', 30),
('The Big Bad Wolf', 1014, '978-0-316-60280-3', '2003-11-17', 'Thriller', 30),
('London Bridges', 1014, '978-0-316-60281-0', '2004-11-15', 'Thriller', 30),
('Mary, Mary', 1014, '978-0-316-71061-4', '2005-11-13', 'Thriller', 30),
('Cross', 1014, '978-0-316-15652-2', '2006-11-13', 'Thriller', 30),
('Double Cross', 1014, '978-0-316-16683-5', '2007-11-13', 'Thriller', 30),
('Cross Country', 1014, '978-0-316-03669-7', '2008-11-17', 'Thriller', 30),
('Alex Cross''s Trial', 1014, '978-0-316-03668-0', '2009-11-09', 'Thriller', 30),
('I, Alex Cross', 1014, '978-0-316-03667-3', '2009-11-16', 'Thriller', 30),
('Cross Fire', 1014, '978-0-316-03665-9', '2010-11-15', 'Thriller', 30),
('Kill Alex Cross', 1014, '978-0-316-03818-9', '2011-11-14', 'Thriller', 30),
('Merry Christmas, Alex Cross', 1014, '978-0-316-21165-4', '2012-11-12', 'Thriller', 30),
('Alex Cross, Run', 1014, '978-0-316-21166-1', '2012-11-20', 'Thriller', 30),
('Cross My Heart', 1014, '978-0-316-21167-8', '2013-11-25', 'Thriller', 30),
('Hope to Die', 1014, '978-0-316-21168-5', '2014-11-24', 'Thriller', 30),
('Cross Justice', 1014, '978-0-316-25285-2', '2015-11-23', 'Thriller', 30),
('The People vs. Alex Cross', 1014, '978-0-316-27365-0', '2017-11-20', 'Thriller', 30),
('Target', 1014, '978-0-316-27361-2', '2018-11-27', 'Thriller', 30),
('Criss Cross', 1014, '978-0-316-27363-6', '2019-11-25', 'Thriller', 30),
('Deadly Cross', 1014, '978-0-316-41018-6', '2020-11-23', 'Thriller', 30),
('Fear No Evil', 1014, '978-0-316-48367-9', '2022-03-15', 'Thriller', 30),
('Steal', 1014, '978-0-316-41017-9', '2022-03-15', 'Thriller', 30);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('Irish Thoroughbred', 1028, '978-0-373-28218-8', '1981-01-01', 'Romance', 33),
('Blithe Images', 1028, '978-0-373-28242-3', '1982-01-01', 'Romance', 33),
('Song of the West', 1028, '978-0-373-28264-5', '1982-01-01', 'Romance', 33),
('Search for Love', 1028, '978-0-373-28287-4', '1982-01-01', 'Romance', 33),
('The Right Path', 1028, '978-0-373-28323-9', '1983-01-01', 'Romance', 33),
('This Magic Moment', 1028, '978-0-373-28345-1', '1983-01-01', 'Romance', 33),
('Her Mother''s Keeper', 1028, '978-0-373-28364-2', '1983-01-01', 'Romance', 33),
('Untamed', 1028, '978-0-373-28420-5', '1983-01-01', 'Romance', 33),
('Unfinished Business', 1028, '978-0-373-28453-3', '1984-01-01', 'Romance', 33),
('Island of Flowers', 1028, '978-0-373-28521-9', '1984-01-01', 'Romance', 33),
('Mind Over Matter', 1028, '978-0-373-28621-6', '1987-01-01', 'Romance', 33),
('Dual Image', 1028, '978-0-373-28765-7', '1987-01-01', 'Romance', 33),
('Winning Hand', 1028, '978-0-373-28873-9', '1988-01-01', 'Romance', 33),
('One Man''s Art', 1028, '978-0-373-29030-5', '1988-01-01', 'Romance', 33),
('Affaire Royale', 1028, '978-1-456-30009-3', '1986-01-01', 'Romance', 33),
('Command Performance', 1028, '978-1-459-23207-2', '1987-01-01', 'Romance', 33),
('The Playboy Prince', 1028, '978-1-459-25251-4', '1987-01-01', 'Romance', 33),
('Cordina''s Crown Jewel', 1028, '978-1-459-28090-4', '1988-01-01', 'Romance', 33),
('Sea Swept', 1028, '978-0-425-17094-1', '1998-01-01', 'Romance', 33),
('Rising Tides', 1028, '978-0-425-17442-0', '1998-01-01', 'Romance', 33),
('Inner Harbor', 1028, '978-0-425-17950-0', '1999-01-01', 'Romance', 33),
('Chesapeake Blue', 1028, '978-0-425-19299-6', '2002-01-01', 'Romance', 33),
('Naked in Death', 1028, '978-0-425-14829-7', '1995-01-01', 'Romantic Suspense', 34),
('Glory in Death', 1028, '978-0-425-15098-6', '1995-01-01', 'Romantic Suspense', 34),
('Immortal in Death', 1028, '978-0-425-15209-6', '1996-01-01', 'Romantic Suspense', 34),
('Rapture in Death', 1028, '978-0-425-15518-9', '1996-01-01', 'Romantic Suspense', 34),
('Ceremony in Death', 1028, '978-0-425-16037-4', '1997-01-01', 'Romantic Suspense', 34),
('Vengeance in Death', 1028, '978-0-425-16439-6', '1997-01-01', 'Romantic Suspense', 34),
('Holiday in Death', 1028, '978-0-425-16636-9', '1998-01-01', 'Romantic Suspense', 34),
('Conspiracy in Death', 1028, '978-0-425-17363-8', '1999-01-01', 'Romantic Suspense',34),
('Loyalty in Death', 1028, '978-0-425-17445-1', '1999-01-01', 'Romantic Suspense', 34),
('Witness in Death', 1028, '978-0-425-17630-1', '2000-01-01', 'Romantic Suspense', 34),
('Judgment in Death', 1028, '978-0-425-17935-7', '2000-01-01', 'Romantic Suspense', 34),
('Betrayal in Death', 1028, '978-0-425-18630-2', '2001-01-01', 'Romantic Suspense', 34),
('Seduction in Death', 1028, '978-0-425-18903-7', '2001-01-01', 'Romantic Suspense', 34),
('Reunion in Death', 1028, '978-0-425-19357-3', '2002-01-01', 'Romantic Suspense', 34),
('Purity in Death', 1028, '978-0-425-19705-2', '2002-01-01', 'Romantic Suspense', 34),
('Portrait in Death', 1028, '978-0-425-19759-5', '2003-01-01', 'Romantic Suspense', 34),
('Imitation in Death', 1028, '978-0-425-19906-2', '2003-01-01', 'Romantic Suspense', 34),
('Divided in Death', 1028, '978-0-425-20150-8', '2004-01-01', 'Romantic Suspense', 34),
('Visions in Death', 1028, '978-0-425-20416-5', '2004-01-01', 'Romantic Suspense', 34),
('Survivor in Death', 1028, '978-0-425-20475-2', '2005-01-01', 'Romantic Suspense', 34),
('Origin in Death', 1028, '978-0-425-20538-4', '2005-01-01', 'Romantic Suspense', 34),
('Memory in Death', 1028, '978-0-425-20835-4', '2006-01-01', 'Romantic Suspense', 34);

INSERT INTO Genres (GenreName)
VALUES ('Espionage');

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('The Alchemist', 1029, '978-0-06-112241-5', '1988-01-01', 'Fiction', 16),
('Brida', 1029, '978-0-06-1578957-5', '1990-01-01', 'Fiction', 16),
('The Valkyries', 1029, '978-0-06-092722-2', '1992-01-01', 'Fiction', 16),
('By the River Piedra I Sat Down and Wept', 1029, '978-0-06-112209-5', '1994-01-01', 'Fiction', 16),
('The Fifth Mountain', 1029, '978-0-06-0733401-9', '1996-01-01', 'Fiction', 16),
('Manual of the Warrior of Light', 1029, '978-0-06-0527983-6', '1997-01-01', 'Fiction', 16),
('Veronika Decides to Die', 1029, '978-0-06-1124266-4', '1998-01-01', 'Fiction', 16),
('The Devil and Miss Prym', 1029, '978-0-06-0528003-0', '2000-01-01', 'Fiction', 16),
('The Zahir', 1029, '978-0-06-0832810-5', '2005-01-01', 'Fiction', 16),
('Like the Flowing River', 1029, '978-0-06-1543601-5', '2006-01-01', 'Non-Fiction', 35),
('The Witch of Portobello', 1029, '978-0-06-1338809-1', '2007-01-01', 'Fiction', 16),
('The Winner Stands Alone', 1029, '978-0-06-1750524-3', '2008-01-01', 'Fiction', 16),
('Aleph', 1029, '978-0-06-2027415-8', '2011-01-01', 'Fiction', 16),
('Manuscript Found in Accra', 1029, '978-0-06-2289691-6', '2013-01-01', 'Fiction', 16),
('Adultery', 1029, '978-0-8041-7019-2', '2014-01-01', 'Fiction', 16),
('The Spy', 1029, '978-0-8041-7034-5', '2016-01-01', 'Fiction', 16),
('Hippie', 1029, '978-0-06-2915295-7', '2018-01-01', 'Fiction', 16),
('The Archer', 1029, '978-0-06-3087411-9', '2020-01-01', 'Fiction, Inspirational', 16),
('The Alchemist - Graphic Novel', 1029, '978-0-06-2435349-4', '2010-01-01', 'Graphic Novel', 36);

SELECT * FROM Genres 

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('Digital Fortress', 1004, '978-0-312-18087-3', '1998-01-01', 'Techno-Thriller', 37),
('Angels & Demons', 1004, '978-0-671-02735-9', '2000-01-01', 'Thriller', 30),
('Deception Point', 1004, '978-0-7432-4302-6', '2001-01-01', 'Techno-Thriller', 37),
('The Da Vinci Code', 1004, '978-0-385-50420-5', '2003-01-01', 'Thriller', 30),
('The Lost Symbol', 1004, '978-0-385-50422-9', '2009-01-01', 'Thriller', 30),
('Inferno', 1004, '978-0-385-53785-8', '2013-01-01', 'Thriller', 30),
('Origin', 1004, '978-0-385-54724-7', '2017-01-01', 'Thriller', 30),
('Wild Symphony', 1004, '978-0-593-12108-1', '2020-01-01', 'Children''s Picture Book', 7);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('Murder on the Orient Express', 1001, '978-0-06-207349-5', '1934-01-01', 'Mystery', 22),
('Death on the Nile', 1001, '978-0-06-207355-6', '1937-11-01', 'Mystery', 22),
('And Then There Were None', 1001, '978-0-06-207348-8', '1939-01-01', 'Mystery', 22),
('The Murder of Roger Ackroyd', 1001, '978-0-06-207356-3', '1926-06-01', 'Mystery', 22),
('The ABC Murders', 1001, '978-0-00-752530-0', '1936-01-01', 'Mystery', 22),
('Hercule Poirot''s Christmas', 1001, '978-0-00-812952-2', '1938-01-01', 'Mystery', 22),
('Murder at the Vicarage', 1001, '978-0-00-712084-7', '1930-10-01', 'Mystery', 22),
('Evil Under the Sun', 1001, '978-0-06-207356-3', '1941-06-01', 'Mystery',22),
('4:50 from Paddington', 1001, '978-0-00-819661-2', '1957-01-01', 'Mystery', 22),
('A Murder Is Announced', 1001, '978-0-00-819661-2', '1950-06-01', 'Mystery', 22),
('The Body in the Library', 1001, '978-0-00-819661-2', '1942-01-01', 'Mystery', 22),
('Murder in Mesopotamia', 1001, '978-0-00-819661-2', '1936-07-01', 'Mystery', 22),
('Cards on the Table', 1001, '978-0-00-819661-2', '1936-11-01', 'Mystery', 22),
('The Moving Finger', 1001, '978-0-00-819661-2', '1942-07-01', 'Mystery', 22),
('Murder in the Mews', 1001, '978-0-00-819661-2', '1937-03-01', 'Mystery', 22),
('N or M?', 1001, '978-0-00-819661-2', '1941-01-01', 'Mystery', 22),
('Murder in the Calais Coach', 1001, '978-0-00-819661-2', '1933-01-01', 'Mystery', 22),
('Five Little Pigs', 1001, '978-0-00-819661-2', '1942-01-01', 'Mystery', 22),
('The Secret of Chimneys', 1001, '978-0-00-819661-2', '1925-06-01', 'Mystery', 22);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('Going Home', 1003, '978-0-440-19437-1', '1973-01-01', 'Fiction', 16),
('Passion''s Promise', 1003, '978-0-440-10780-6', '1976-01-01', 'Romance', 32),
('The Promise', 1003, '978-0-385-34129-6', '1978-01-01', 'Romance', 32),
('Season of Passion', 1003, '978-0-440-17460-4', '1979-01-01', 'Romance', 32),
('Summer''s End', 1003, '978-0-440-17299-0', '1980-01-01', 'Fiction, Romance', 32),
('The Ring', 1003, '978-0-440-10629-8', '1980-01-01', 'Fiction, Romance', 32),
('Palomino', 1003, '978-0-440-10854-4', '1981-01-01', 'Fiction, Romance', 32),
('To Love Again', 1003, '978-0-440-11572-6', '1981-01-01', 'Romance', 32),
('Remembrance', 1003, '978-0-385-11217-4', '1981-01-01', 'Romance', 32),
('Loving', 1003, '978-0-440-15350-7', '1981-01-01', 'Romance', 32),
('Once in a Lifetime', 1003, '978-0-385-11621-6', '1982-01-01', 'Romance', 32),
('Crossings', 1003, '978-0-385-11593-6', '1982-01-01', 'Romance', 32),
('A Perfect Stranger', 1003, '978-0-440-16888-7', '1983-01-01', 'Romance', 32),
('Thurston House', 1003, '978-0-440-10899-5', '1983-01-01', 'Romance', 32),
('Changes', 1003, '978-0-440-17445-1', '1983-01-01', 'Romance', 32),
('Full Circle', 1003, '978-0-440-14437-8', '1984-01-01', 'Romance', 32),
('Family Album', 1003, '978-0-385-11448-9', '1985-01-01', 'Romance', 32),
('Secrets', 1003, '978-0-440-18979-0', '1985-01-01', 'Romance', 32),
('Wanderlust', 1003, '978-0-440-12912-8', '1986-01-01', 'Romance', 32),
('Fine Things', 1003, '978-0-440-16214-3', '1987-01-01', 'Romance', 32),
('Kaleidoscope', 1003, '978-0-385-12107-5', '1987-01-01', 'Romance', 32),
('Zoya', 1003, '978-0-385-11970-7', '1988-01-01', 'Romance', 32),
('Star', 1003, '978-0-440-11571-9', '1989-01-01', 'Romance', 32),
('Daddy', 1003, '978-0-385-24959-5', '1989-01-01', 'Romance', 32),
('Heartbeat', 1003, '978-0-385-24961-8', '1991-01-01', 'Romance', 32),
('Message from Nam', 1003, '978-0-385-31705-5', '1990-01-01', 'Romance', 32),
('Jewels', 1003, '978-0-385-30115-7', '1992-01-01', 'Romance', 32),
('Secrets', 1003, '978-0-440-22124-8', '1986-01-01', 'Romance', 32),
('Mixed Blessings', 1003, '978-0-385-30809-5', '1993-01-01', 'Romance', 32),
('Vanished', 1003, '978-0-385-30450-9', '1993-01-01', 'Romance', 32),
('Accident', 1003, '978-0-385-30489-9', '1994-01-01', 'Romance', 32),
('The Ghost', 1003, '978-0-385-30488-2', '1995-01-01', 'Romance', 32),
('Malice', 1003, '978-0-385-31098-2', '1996-01-01', 'Romance', 32);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('The Notebook', 1027, '978-0-446-52025-4', '1996-01-01', 'Romance', 32),
('Message in a Bottle', 1027, '978-0-446-52061-2', '1998-01-01', 'Romance', 32),
('A Walk to Remember', 1027, '978-0-446-52531-0', '1999-01-01', 'Romance', 32),
('The Lucky One', 1027, '978-0-446-58054-5', '2008-01-01', 'Romance', 32),
('The Last Song', 1027, '978-0-446-53807-0', '2009-01-01', 'Romance', 32),
('Safe Haven', 1027, '978-0-446-57362-4', '2010-01-01', 'Romance', 32),
('The Best of Me', 1027, '978-0-446-53353-2', '2011-01-01', 'Romance', 32),
('The Longest Ride', 1027, '978-1-455-50664-4', '2013-01-01', 'Romance', 32),
('See Me', 1027, '978-1-455-52496-2', '2015-01-01', 'Romance', 32),
('Two by Two', 1027, '978-1-455-52172-5', '2016-01-01', 'Romance', 32),
('Every Breath', 1027, '978-1-538-70412-5', '2018-01-01', 'Romance', 32),
('The Return', 1027, '978-1-538-73855-5', '2020-01-01', 'Romance', 32),
('The Wish', 1027, '978-0-446-19908-4', '2021-01-01', 'Romance', 32),
('The Wish (Paperback)', 1027, '978-1-538-75951-4', '2022-01-01', 'Romance', 32),
('The Wish (Large Print)', 1027, '978-0-755-37623-0', '2022-01-01', 'Romance', 32),
('The Wish (Audio CD)', 1027, '978-0-316-63904-1', '2022-01-01', 'Romance', 32),
('The Wish (Audio Download)', 1027, '978-1-478-92963-5', '2022-01-01', 'Romance', 32),
('The Wish (Ebook)', 1027, '978-0-446-57364-8', '2022-01-01', 'Romance', 32),
('The Wish (Digital Audiobook)', 1027, '978-1-478-91867-5', '2022-01-01', 'Romance', 32),
('The Wish (Library Binding)', 1027, '978-0-446-57363-1', '2022-01-01', 'Romance', 32);

SELECT * FROM Books 

UPDATE Books
SET GenreID = 33
WHERE AuthorId = 1027
  AND BookId  BETWEEN 3203 AND 3222;

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('A Game of Thrones', 1009, '978-0-553-10354-0', '1996', 'Fantasy', 15),
('A Clash of Kings', 1009, '978-0-553-10803-3', '1999', 'Fantasy', 15),
('A Storm of Swords', 1009, '978-0-553-10803-3', '2000', 'Fantasy', 15),
('A Feast for Crows', 1009, '978-0-553-10354-0', '2005', 'Fantasy', 15),
('A Dance with Dragons', 1009, '978-0-553-80147-7', '2011', 'Fantasy', 15),
('Fire & Blood', 1009, '978-1-524-71983-2', '2018', 'Fantasy', 15),
('Dying of the Light', 1009, '978-1-616-96061-7', '1977', 'Science Fiction', 26),
('Windhaven', 1009, '978-0-553-27793-4', '1981', 'Science Fiction', 26),
('Fevre Dream', 1009, '978-0-312-89045-6', '1982', 'Horror', 32),
('The Armageddon Rag', 1009, '978-0-553-37998-3', '1983', 'Thriller', 30),
('The Ice Dragon (Children''s book)', 1009, '978-0-765-31586-5', '1980', 'Fantasy', 15 ),
('Hunter''s Run', 1009, '978-0-06-137329-9', '2007', 'Science Fiction', 26),
('Tuf Voyaging', 1009, '978-0-553-38520-5', '1986', 'Science Fiction', 26),
('Portraits of His Children', 1009, '978-0-912-51544-7', '1987', 'Fantasy', 15),
('Nightflyers', 1009, '978-0-553-27794-1', '1985', 'Horror', 32),
('A Knight of the Seven Kingdoms', 1009, '978-0-345-53349-6', '2015', 'Fantasy', 15),
('Quartet: Four Tales', 1009, '978-1-596-06225-4', '2001', 'Fantasy', 15),
('Dreamsongs: A Retrospective', 1009, '978-0-553-80452-9', '2003', 'Fantasy', 15),
('Dreamsongs Volume II', 1009, '978-0-553-80453-6', '2007', 'Fantasy', 15),
('Dreamsongs Volume I', 1009, '978-0-553-80454-3', '2010', 'Fantasy', 15),
('The World of Ice & Fire', 1009, '978-0-553-80544-1', '2014', 'Fantasy', 15),
('Fire & Blood: Volume 1', 1009, '978-1-785-15101-2', '2018', 'Fantasy', 15);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('Killing Floor', 1022, '978-0-515-12308-7', '1997-01-01', 'Mystery', 22),
('Die Trying', 1022, '978-0-515-12455-8', '1998-01-01', 'Mystery', 22),
('Tripwire', 1022, '978-0-515-12307-0', '1999-01-01', 'Mystery', 22),
('Running Blind', 1022, '978-0-515-12960-7', '2000-01-01', 'Mystery', 22),
('Echo Burning', 1022, '978-0-515-13156-3', '2001-01-01', 'Mystery', 22),
('Without Fail',1022, '978-0-515-13361-1', '2002-01-01', 'Mystery', 22),
('Persuader', 1022, '978-0-385-33649-1', '2003-01-01', 'Mystery', 22),
('The Enemy', 1022, '978-0-440-24252-0', '2004-01-01', 'Mystery', 22),
('One Shot', 1022, '978-0-440-24457-9', '2005-01-01', 'Mystery', 22),
('The Hard Way', 1022, '978-0-385-33903-4', '2006-01-01', 'Mystery', 22),
('Bad Luck and Trouble', 1022, '978-0-385-33904-1', '2007-01-01', 'Mystery', 22),
('Nothing to Lose', 1022, '978-0-440-24366-6', '2008-01-01', 'Mystery', 22),
('Gone Tomorrow', 1022, '978-0-440-24368-0', '2009-01-01', 'Mystery', 22),
('61 Hours', 1022, '978-0-385-34378-7', '2010-01-01', 'Mystery', 22),
('Worth Dying For', 1022, '978-0-385-34379-4', '2010-01-01', ' Mystery', 22),
('The Affair', 1022, '978-0-385-34380-0', '2011-01-01', 'Mystery', 22),
('A Wanted Man', 1022, '978-0-440-24658-0', '2012-01-01', 'Mystery', 22),
('Never Go Back', 1022, '978-0-385-34779-3', '2013-01-01', 'Mystery', 22),
('Personal', 1022, '978-0-385-34778-6', '2014-01-01', 'Mystery', 22),
('Make Me', 1022, '978-0-804-17665-7', '2015-01-01', 'Mystery', 22),
('Night School', 1022, '978-0-804-17716-6', '2016-01-01', 'Mystery', 22),
('The Midnight Line', 1022, '978-0-399-17743-6', '2017-01-01', 'Mystery', 22),
('Past Tense', 1022, '978-0-399-17744-3', '2018-01-01', 'Mystery', 22),
('Blue Moon',1022, '978-0-399-17745-0', '2019-01-01', 'Mystery', 22),
('The Sentinel', 1022, '978-0-399-17746-7', '2020-01-01', 'Mystery', 22);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('The Black Echo', 1024, '978-0-316-60529-3', '1992-01-01', 'Crime', 12),
('The Black Ice', 1024, '978-0-316-15496-4', '1993-01-01', 'Crime', 12),
('The Concrete Blonde', 1024, '978-0-316-15497-1', '1994-01-01', 'Crime', 12),
('The Last Coyote', 1024, '978-0-316-15498-8', '1995-01-01', 'Crime', 12),
('Trunk Music', 1024, '978-0-316-15499-5', '1997-01-01', 'Crime', 12),
('Angels Flight', 1024, '978-0-316-15500-8', '1999-01-01', 'Crime', 12),
('A Darkness More Than Night', 1024, '978-0-316-15501-5', '2001-01-01', 'Crime', 12),
('City of Bones',1024, '978-0-316-15502-2', '2002-01-01', 'Crime', 12),
('Lost Light', 1024, '978-0-316-73493-7', '2003-01-01', 'Crime', 12),
('The Narrows', 1024, '978-0-316-73494-4', '2004-01-01', 'Crime', 12),
('The Closers', 1024, '978-0-316-73495-1', '2005-01-01', 'Crime', 12),
('Echo Park', 1024, '978-0-316-73496-8', '2006-01-01', 'Crime', 12),
('The Overlook', 1024, '978-0-316-73497-5', '2007-01-01', 'Crime', 12),
('Nine Dragons', 1024, '978-0-316-17084-2', '2009-01-01', 'Crime', 12),
('The Drop', 1024, '978-0-316-17085-9', '2011-01-01', 'Crime', 12),
('The Black Box', 1024, '978-0-316-20720-0', '2012-01-01', 'Crime', 12),
('The Burning Room', 1024, '978-0-316-22593-9', '2014-01-01', 'Crime', 12),
('The Crossing', 1024, '978-0-316-22594-6', '2015-01-01', 'Crime', 12),
('The Wrong Side of Goodbye', 1024, '978-0-316-22595-3', '2016-01-01', 'Crime', 12),
('Two Kinds of Truth', 1024, '978-0-316-22596-0', '2017-01-01', 'Crime', 12),
('Dark Sacred Night', 1024, '978-0-316-22597-7', '2018-01-01', 'Crime', 12),
('The Night Fire', 1024, '978-0-316-48499-3', '2019-01-01', 'Crime', 12),
('Fair Warning', 1024, '978-0-316-48661-4', '2020-01-01', 'Crime', 12);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('The Hunt for Red October', 1035, '978-0-870-21366-0', '1984-01-01',  'Espionage', 38),
('Red Storm Rising', 1035, '978-0-425-15879-5', '1986-01-01', 'Thriller', 30),
('Patriot Games', 1035, '978-0-425-14432-4', '1987-01-01', 'Espionage', 38),
('The Cardinal of the Kremlin', 1035, '978-0-425-14611-3', '1988-01-01', 'Espionage', 38),
('Clear and Present Danger', 1035, '978-0-425-14068-5', '1989-01-01', 'Espionage', 38),
('The Sum of All Fears', 1035, '978-0-425-14654-0', '1991-01-01', 'Espionage', 38),
('Without Remorse', 1035, '978-0-425-16790-3', '1993-01-01', 'Thriller', 30),
('Debt of Honor', 1035, '978-0-425-17618-8', '1994-01-01', 'Espionage', 38),
('Executive Orders', 1035, '978-0-425-17935-6', '1996-01-01', 'Espionage', 38),
('The Bear and the Dragon', 1035, '978-0-399-14865-2', '2000-01-01', ' Espionage', 38),
('Red Rabbit', 1035, '978-0-399-14961-1', '2002-01-01', 'Espionage', 38),
('The Teeth of the Tiger', 1035, '978-0-425-20406-8', '2003-01-01', 'Espionage', 38),
('Dead or Alive', 1035, '978-0-399-15743-9', '2010-01-01', 'Espionage', 38),
('Locked On', 1035, '978-0-399-15740-8', '2011-01-01', 'Espionage', 38),
('Threat Vector', 1035, '978-0-399-15823-8', '2012-01-01', ' Espionage', 38),
('Command Authority', 1035, '978-0-399-16314-3', '2013-01-01', 'Espionage', 38),
('Support and Defend', 1035, '978-0-399-17019-3', '2014-01-01', 'Espionage', 38),
('Full Force and Effect', 1035, '978-0-399-17692-0', '2014-01-01', 'Espionage', 38),
('Commander in Chief', 1035, '978-0-399-17695-1', '2015-01-01', 'Espionage', 38),
('Duty and Honor', 1035, '978-0-399-17701-6', '2016-01-01', 'Espionage', 38),
('Point of Contact', 1035, '978-0-735-21560-3', '2017-01-01', 'Espionage', 38),
('Power and Empire', 1035, '978-0-735-21749-2', '2017-01-01', 'Espionage', 38),
('Line of Sight', 1035, '978-0-735-21877-2', '2018-01-01', 'Espionage', 38),
('Oath of Office', 1035, '978-0-735-21963-2', '2019-01-01', 'Espionage', 38),
('Code of Honor', 1035, '978-0-735-21964-9', '2020-01-01', 'Espionage', 38),
('Firing Point (co-authored)', 1035, '978-0-525-54018-9', '2020-01-01', 'Espionage', 38),
('Shadow of the Dragon (co-authored)', 1035, '978-0-593-18956-6', '2021-01-01', 'Espionage', 38),
('Target Acquired (co-authored)', 1035, '978-0-735-22122-2', '2021-01-01', 'Espionage', 38),
('Chain of Command (co-authored)', 1035, '978-0-735-22271-7', '2022-01-01', 'Espionage', 38),
('Act of Valor (co-authored)', 1035, '978-0-451-23011-3', '2012-01-01', 'Espionage', 38),
('Into the Storm (co-authored)', 1035, '978-0-399-16211-5', '2008-01-01', 'Espionage', 38),
('Every Man a Tiger (co-authored)', 1035, '978-0-399-15741-5', '1999-01-01', 'Non-Fiction', 35),
('The Bear and the Dragon (co-authored)', 1035, '978-0-399-14726-6', '2000-01-01', 'Espionage', 38),
('Red Rabbit (co-authored)', 1035, '978-0-399-14961-1', '2002-01-01', 'Espionage', 38);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('One for the Money', 1018, '978-0-312-20540-1', '1994-01-01', 'Humor', 39),
('Two for the Dough', 1018, '978-0-684-19603-9', '1996-01-01', 'Humor', 39),
('Three to Get Deadly', 1018, '978-0-684-80189-7', '1997-01-01', 'Humor', 39),
('Four to Score', 1018, '978-0-312-19545-5', '1998-01-01', 'Humor', 39),
('High Five', 1018, '978-0-312-18758-0', '1999-01-01', 'Humor', 39),
('Hot Six', 1018, '978-0-312-20602-6', '2000-01-01', 'Humor', 39),
('Seven Up', 1018, '978-0-312-20414-5', '2001-01-01', ' Humor', 39),
('Hard Eight', 1018, '978-0-312-20662-0', '2002-01-01', 'Humor', 39),
('To the Nines', 1018, '978-0-312-20386-5', '2003-01-01', 'Humor', 39),
('Ten Big Ones', 1018, '978-0-312-20541-8', '2004-01-01', 'Humor', 39),
('Eleven on Top', 1018, '978-0-312-31058-7', '2005-01-01', 'Humor', 39),
('Twelve Sharp', 1018, '978-0-312-31059-4', '2006-01-01', 'Humor', 39),
('Lean Mean Thirteen', 1018, '978-0-312-35896-5', '2007-01-01', 'Humor', 39),
('Fearless Fourteen', 1018, '978-0-312-35897-2', '2008-01-01', 'Humor', 39),
('Finger Lickin'' Fifteen', 1018, '978-0-312-38342-6', '2009-01-01', 'Humor', 39),
('Sizzling Sixteen', 1018, '978-0-312-38343-3', '2010-01-01', 'Humor', 39),
('Smokin'' Seventeen', 1018, '978-0-312-38344-0', '2011-01-01', 'Humor', 39),
('Explosive Eighteen', 1018, '978-0-345-53028-0', '2011-01-01', 'Humor', 39),
('Notorious Nineteen', 1018, '978-0-345-53029-7', '2012-01-01', 'Humor', 39),
('Takedown Twenty', 1018, '978-0-345-53030-3', '2013-01-01', 'Humor', 39),
('Top Secret Twenty-One', 1018, '978-0-345-54394-1', '2014-01-01', 'Humor', 39),
('Tricky Twenty-Two', 1018, '978-0-345-54395-8', '2015-01-01', 'Humor', 39),
('Turbo Twenty-Three', 1018, '978-0-345-54396-5', '2016-01-01', 'Humor', 39),
('Hardcore Twenty-Four', 1018, '978-0-345-54397-2', '2017-01-01', 'Humor', 39),
('Look Alive Twenty-Five', 1018, '978-1-982-10365-5', '2018-01-01', 'Humor', 39),
('Twisted Twenty-Six', 1018, '978-1-982-10367-9', '2019-01-01', 'Humor', 39),
('Fortune and Glory', 1018, '978-1-982-10369-3', '2020-01-01', 'Humor', 39),
('Game On: Tempting Twenty-Eight', 1018, '978-1-250-15552-1', '2021-01-01', 'Humor', 39);


INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('Tuesdays with Morrie', 1025, '978-0-385-48451-8', '1997-01-01', 'Memoir', 40),
('The Five People You Meet in Heaven', 1025, '978-0-385-50309-1', '2003-01-01', 'Fiction', 16),
('For One More Day', 1025, '978-0-786-86988-3', '2006-01-01', 'Fiction', 16),
('Have a Little Faith', 1025, '978-0-786-87031-5', '2009-01-01', 'Non-Fiction', 35),
('The Time Keeper', 1025, '978-1-401-35991-9', '2012-01-01', 'Fiction', 16),
('The First Phone Call from Heaven', 1025, '978-0-06-229437-1', '2013-01-01', 'Fiction', 16),
('The Magic Strings of Frankie Presto', 1025, '978-0-06-229441-8', '2015-01-01', 'Fiction', 16),
('The Next Person You Meet in Heaven', 1025, '978-0-06-229444-9', '2018-01-01', 'Fiction', 16),
('Finding Chika', 1025, '978-0-06-295239-4', '2019-01-01', 'Memoir', 40),
('The Stranger in the Lifeboat (forthcoming)', 1025, '978-0-06-304260-1', '2022-01-01', 'Fiction', 16);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('Star Quest', 1006, '978-0-441-16551-2', '1968-01-01', 'Science Fiction', 26),
('Fear That Man', 1006, '978-0-425-02256-2', '1969-01-01', 'Thriller', 30),
('Beastchild', 1006, '978-0-425-02669-0', '1970-01-01', 'Horror', 32),
('Demon Seed', 1006, '978-0-425-02660-7', '1973-01-01', 'Science Fiction', 26),
('Shattered', 1006, '978-0-425-02702-4', '1973-01-01', 'Thriller', 30),
('The Vision', 1006, '978-0-425-02746-8', '1977-01-01', 'Horror', 32),
('The Key to Midnight', 1006, '978-0-425-02777-2', '1979-01-01', 'Thriller', 30),
('Whispers', 1006, '978-0-425-02801-4', '1980-01-01', 'Horror', 32),
('The Funhouse', 1006, '978-0-425-02840-3', '1980-01-01', 'Horror', 32),
('Phantoms', 1006, '978-0-425-02844-1', '1983-01-01', 'Horror', 32),
('Darkfall', 1006, '978-0-425-02847-2', '1984-01-01', 'Horror', 32),
('Shadowfires', 1006, '978-0-425-02852-6', '1987-01-01', 'Horror', 32),
('Midnight', 1006, '978-0-425-02863-2', '1989-01-01', 'Horror', 32),
('Lightning', 1006, '978-0-425-13801-5', '1988-01-01', 'Horror', 32),
('Watchers', 1006, '978-0-425-13949-4', '1987-01-01', 'Horror', 32),
('Strangers', 1006, '978-0-425-14041-8', '1986-01-01', 'Horror', 32),
('The Voice of the Night', 1006, '978-0-425-14043-2', '1980-01-01', 'Horror', 32),
('Intensity', 1006, '978-0-553-09763-9', '1996-01-01', 'Horror', 32),
('Sole Survivor', 1006, '978-0-553-57689-3', '1997-01-01', 'Horror', 32),
('Fear Nothing', 1006, '978-0-553-57690-9', '1998-01-01', 'Horror', 32),
('Seize the Night', 1006, '978-0-553-57691-6', '1998-01-01', 'Horror', 32),
('False Memory', 1006, '978-0-553-57717-3', '1999-01-01', 'Horror', 32),
('From the Corner of His Eye', 1006, '978-0-553-80344-7', '2000-01-01', 'Horror', 32),
('One Door Away from Heaven', 1006, '978-0-553-80342-3', '2001-01-01', 'Horror', 32),
('By the Light of the Moon', 1006, '978-0-553-80345-4', '2002-01-01', 'Horror', 32),
('The Face', 1006, '978-0-553-80177-4', '2003-01-01', 'Horror', 32),
('Odd Thomas', 1006, '978-0-553-58250-4', '2003-01-01', 'Horror', 32),
('The Taking', 1006, '978-0-553-80346-1', '2004-01-01', 'Horror', 32),
('Life Expectancy', 1006, '978-0-553-80462-8', '2004-01-01', 'Horror', 32),
('Brother Odd', 1006, '978-0-553-80528-2', '2006-01-01', 'Horror', 32),
('Velocity', 1006, '978-0-553-80347-8', '2005-01-01', 'Horror', 32),
('The Husband', 1006, '978-0-553-80500-8', '2006-01-01', 'Horror', 32),
('Forever Odd', 1006, '978-0-553-80348-5', '2006-01-01', 'Horror', 32),
('The Good Guy', 1006, '978-0-553-80502-2', '2007-01-01', 'Horror', 32),
('The Darkest Evening of the Year', 1006, '978-0-553-80463-5', '2007-01-01', 'Horror', 32),
('Your Heart Belongs to Me', 1006, '978-0-553-80464-2', '2008-01-01', 'Horror', 32),
('Odd Hours', 1006, '978-0-553-80465-9', '2008-01-01', 'Horror', 32),
('Breathless', 1006, '978-0-553-80501-5', '2009-01-01', 'Horror', 32),
('Relentless', 1006, '978-0-553-80503-9', '2009-01-01', 'Horror', 32);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('Absolute Power', 1005, '978-0-446-51865-4', '1996-01-01', 'Thriller', 30),
('Total Control', 1005, '978-0-446-52572-0', '1997-01-01', 'Thriller', 30),
('The Winner', 1005, '978-0-446-52076-3', '1998-01-01', 'Thriller', 30),
('The Simple Truth', 1005, '978-0-446-52077-0', '1998-01-01', 'Thriller', 30),
('Saving Faith', 1005, '978-0-446-52078-7', '1999-01-01', 'Thriller', 30),
('Wish You Well', 1005, '978-0-446-52581-2', '2000-01-01', 'Fiction', 16),
('Last Man Standing', 1005, '978-0-446-52589-8', '2001-01-01', 'Thriller', 30),
('The Christmas Train', 1005, '978-0-446-52742-7', '2002-01-01', 'Romance', 33),
('Split Second', 1005, '978-0-446-57959-0', '2003-01-01', 'Thriller', 30),
('Hour Game', 1005, '978-0-446-57735-0', '2004-01-01', 'Thriller', 30),
('The Camel Club', 1005, '978-0-446-57733-6', '2005-01-01', 'Thriller', 30),
('The Collectors', 1005, '978-0-446-57734-3', '2006-01-01', 'Thriller', 30),
('Simple Genius', 1005, '978-0-446-61822-6', '2007-01-01', 'Thriller', 30),
('Stone Cold', 1005, '978-0-446-61823-3', '2007-01-01', 'Thriller', 30),
('The Whole Truth', 1005, '978-0-446-61825-7', '2008-01-01', 'Thriller', 30),
('Divine Justice', 1005, '978-0-446-61826-4', '2008-01-01', 'Thriller', 30),
('First Family', 1005, '978-0-446-53909-9', '2009-01-01', 'Thriller', 30),
('True Blue', 1005, '978-0-446-53911-2', '2009-01-01', 'Thriller', 30),
('Deliver Us from Evil', 1005, '978-0-446-56271-6', '2010-01-01', 'Thriller', 30),
('Hells Corner', 1005, '978-0-446-53761-3', '2010-01-01', 'Thriller', 30),
('One Summer', 1005, '978-0-446-55661-6', '2011-01-01', 'Romance', 33),
('The Sixth Man', 1005, '978-0-446-53762-0', '2011-01-01', 'Thriller', 30),
('Zero Day', 1005, '978-0-446-53758-3', '2011-01-01', 'Thriller', 30),
('The Innocent', 1005, '978-0-446-53759-0', '2012-01-01', 'Thriller', 30),
('The Forgotten', 1005, '978-0-446-57346-8', '2012-01-01', 'Thriller', 30),
('The Hit', 1005, '978-0-446-57347-5', '2013-01-01', 'Thriller', 30),
('The Target', 1005, '978-0-446-57350-5', '2014-01-01', 'Thriller', 30),
('The Escape', 1005, '978-1-455-53565-8', '2014-01-01', 'Thriller', 30),
('The Guilty', 1005, '978-1-455-54967-9', '2015-01-01', 'hriller', 30),
('Memory Man', 1005, '978-1-455-54618-0', '2015-01-01', 'Thriller', 30),
('The Last Mile', 1005, '978-1-455-54619-7', '2016-01-01', 'Thriller', 30),
('No Mans Land', 1005, '978-1-455-54620-3','2016-01-01', 'Thriller', 30),
('The Fix', 1005, '978-1-455-54621-0', '2017-01-01', 'Thriller', 30),
('End Game', 1005, '978-1-455-54622-7', '2017-01-01', 'Thriller', 30),
('Long Road to Mercy', 1005, '978-1-533-63547-5', '2018-01-01', 'Thriller', 30),
('Redemption', 1005, '978-1-533-13394-2', '2019-01-01', 'Thriller', 30),
('A Minute to Midnight', 1005, '978-1-455-55779-0', '2019-01-01', 'Thriller', 30),
('Walk the Wire', 1005, '978-1-455-57800-7', '2020-01-01', 'Thriller', 30),
('Daylight', 1005, '978-1-455-57802-1', '2020-01-01', 'Thriller', 30),
('A Gambling Man', 1005, '978-1-455-57803-8', '2021-01-01', 'Thriller', 30),
('Mercy', 1005, '978-1-455-59166-2', '2021-01-01', 'Thriller', 30),
('Memory', 1005, '978-1-455-59167-9', '2022-01-01', 'Mystery', 22);


INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('Songs of the Humpback Whale', 1019, '978-0-743-41782-8', '1992-01-01', 'Fiction', 16),
('Harvesting the Heart', 1019, '978-0-671-77860-3', '1994-01-01', 'Fiction', 16),
('Picture Perfect', 1019, '978-0-671-00548-4', '1995-01-01', 'Fiction', 16),
('Mercy', 1019, '978-0-671-53472-6', '1996-01-01', 'Fiction', 16),
('The Pact', 1019, '978-0-06-073758-2', '1998-01-01', 'Fiction', 16),
('Keeping Faith', 1019, '978-0-06-103024-9', '1999-01-01', 'Fiction', 16),
('Plain Truth', 1019, '978-0-743-22347-1', '2000-01-01', 'Fiction', 16),
('Salem Falls', 1019, '978-0-743-22618-2', '2001-01-01', 'Fiction', 16),
('Perfect Match', 1019, '978-0-743-27155-4', '2002-01-01', 'Fiction', 16),
('Second Glance', 1019, '978-0-743-27157-8', '2003-01-01', 'Fiction', 16),
('My Sister''s Keeper', 1019, '978-0-743-27695-5', '2004-01-01', 'Fiction', 16),
('Vanishing Acts', 1019, '978-0-743-27697-9', '2005-01-01', 'Fiction', 16),
('The Tenth Circle', 1019, '978-0-743-27809-6', '2006-01-01', 'Fiction', 16),
('Nineteen Minutes', 1019, '978-0-743-27808-9', '2007-01-01', 'Fiction', 16),
('Change of Heart', 1019, '978-0-743-27807-2', '2008-01-01', 'Fiction', 16),
('Handle with Care', 1019, '978-0-743-27806-5', '2009-01-01', 'Fiction', 16),
('House Rules', 1019, '978-0-743-27805-8', '2010-01-01', 'Fiction', 16),
('Sing You Home', 1019, '978-0-743-27983-3', '2011-01-01', 'Fiction', 16),
('Lone Wolf', 1019, '978-1-451-62168-2', '2012-01-01', 'Fiction', 16),
('The Storyteller', 1019, '978-1-451-67583-6', '2013-01-01', 'Fiction', 16),
('Leaving Time', 1019, '978-0-345-54493-1', '2014-01-01', 'Fiction', 16),
('Off the Page (with Samantha van Leer)', 1019, '978-0-553-53838-1', '2015-01-01', 'Fiction', 16),
('Small Great Things', 1019, '978-0-345-54494-8', '2016-01-01', 'Fiction', 16),
('The Book of Two Ways', 1019, '978-1-983-64724-5', '2020-01-01', 'Fiction', 16),
('Wish You Were Here', 1019, '978-0-593-23127-6', '2021-01-01', 'Fiction', 16),
('Wish You Were Here (Paperback)', 1019, '978-0-593-23126-9', '2021-01-01', 'Fiction', 16),
('Wish You Were Here (Large Print)', 1019, '978-0-593-23125-2', '2021-01-01', 'Fiction', 16);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID) VALUES
('Gregor the Overlander', 1033, '978-0-439-65092-6', '2003-01-01', 'Fantasy', 15),
('Gregor and the Prophecy of Bane', 1033, '978-0-439-65634-8', '2004-01-01', 'Fantasy', 15),
('Gregor and the Curse of the Warmbloods', 1033, '978-0-439-65094-0', '2005-01-01', 'Fantasy', 15),
('Gregor and the Marks of Secret', 1033, '978-0-439-65096-4', '2006-01-01', 'Fantasy', 15),
('Gregor and the Code of Claw', 1033, '978-0-439-65097-1', '2007-01-01', 'Fantasy', 15),
('The Hunger Games', 1033, '978-0-439-02348-1', '2008-01-01', 'Dystopian', 13),
('Catching Fire', 1033, '978-0-439-02349-8', '2009-01-01', 'Dystopian', 13),
('Mockingjay', 1033, '978-0-439-02350-4', '2010-01-01', 'Dystopian', 13),
('Year of the Jungle', 1033, '978-0-316-24784-3', '2013-01-01', 'Childrens Picture Book', 7),
('The Ballad of Songbirds and Snakes', 1033, '978-1-338-34074-4', '2020-01-01', 'Dystopian', 13);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('Play Dead', 1012, '978-0-451-20765-0', '1990-01-01', 'Mystery', 22),
('Miracle Cure', 1012, '978-0-451-20556-4', '1991-01-01', 'Mystery', 22),
('Deal Breaker (Myron Bolitar #1)', 1012, '978-0-345-41941-0', '1995-01-01', 'Mystery', 22),
('Drop Shot (Myron Bolitar #2)', 1012, '978-0-345-41942-7', '1996-01-01', 'Mystery', 22),
('Fade Away (Myron Bolitar #3)', 1012, '978-0-345-41943-4', '1996-01-01', 'Mystery', 22),
('Back Spin (Myron Bolitar #4)', 1012, '978-0-345-41944-1', '1997-01-01', 'Mystery', 22),
('One False Move (Myron Bolitar #5)', 1012, '978-0-345-41945-8', '1998-01-01', 'Mystery', 22),
('The Final Detail (Myron Bolitar #6)', 1012, '978-0-345-41946-5', '1999-01-01', 'Mystery', 22),
('Darkest Fear (Myron Bolitar #7)', 1012, '978-0-345-41947-2', '2000-01-01', 'Mystery', 22),
('Tell No One', 1012, '978-0-385-33521-6', '2001-01-01', 'Mystery', 22),
('Gone for Good', 1012, '978-0-385-33522-3', '2002-01-01', 'Mystery', 22),
('No Second Chance', 1012, '978-0-525-94607-0', '2003-01-01', 'Mystery', 22),
('Just One Look', 1012, '978-0-525-94780-0', '2004-01-01', 'Mystery', 22),
('The Innocent', 1012, '978-0-525-94971-2', '2005-01-01', 'Mystery', 22),
('Promise Me (Myron Bolitar #8)', 1012, '978-0-525-94970-5', '2006-01-01', 'Mystery', 22),
('The Woods', 1012, '978-0-525-94972-9', '2007-01-01', 'Mystery', 22),
('Hold Tight', 1012, '978-0-525-95019-0', '2008-01-01', 'Mystery', 22),
('Long Lost (Myron Bolitar #9)', 1012, '978-0-525-95103-6', '2009-01-01', 'Mystery', 22),
('Caught', 1012, '978-0-525-95102-9', '2010-01-01', 'Mystery', 22),
('Live Wire (Myron Bolitar #10)', 1012, '978-0-525-95233-0', '2011-01-01', 'Mystery', 22),
('Shelter (Mickey Bolitar #1)', 1012, '978-0-399-25712-8', '2011-01-01', 'Mystery', 22),
('Stay Close', 1012, '978-0-525-95314-6', '2012-01-01', 'Mystery', 22),
('Seconds Away (Mickey Bolitar #2)', 1012, '978-0-399-25716-6', '2012-01-01', 'Mystery', 22),
('Six Years', 1012, '978-0-525-95313-9', '2013-01-01', 'Mystery, Thriller', 22),
('Missing You', 1012, '978-0-525-95315-3', '2014-01-01', 'Mystery', 22),
('The Stranger', 1012, '978-0-525-95438-9', '2015-01-01', 'Mystery', 22),
('Fool Me Once', 1012, '978-0-525-95436-5', '2016-01-01', 'Mystery', 22),
('Home', 1012, '978-0-525-95439-6', '2016-01-01', 'Mystery', 22),
('Don''t Let Go', 1012, '978-0-525-95437-2', '2017-01-01', 'Mystery', 22),
('Run Away', 1012, '978-1-538-72806-0', '2019-01-01', 'Mystery', 22),
('The Boy from the Woods', 1012, '978-1-538-72212-0', '2020-01-01', 'Mystery', 22),
('The Match', 1012, '978-1-499-89587-8', '2022-01-01', 'Mystery', 22),
('Gone for Good (Paperback)', 1012, '978-0-385-33523-0', '2003-01-01', 'Mystery', 22);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('The Barefoot Contessa Cookbook', 1013, '978-0-60-960219-5', '1999-01-01', 'Cooking', 10),
('Barefoot Contessa Parties!', 1013, '978-0-60-961066-4', '2001-01-01', 'Cooking', 10),
('Barefoot Contessa Family Style', 1013, '978-1-40-006990-3', '2002-01-01', 'Cooking', 10),
('Barefoot in Paris: Easy French Food You Can Make at Home', 1013, '978-1-40-004189-3', '2004-01-01', 'Cooking', 10),
('Barefoot Contessa at Home', 1013, '978-1-40-005434-3', '2006-01-01', 'Cooking', 10),
('Barefoot Contessa Back to Basics', 1013, '978-0-77-043793-4', '2008-01-01', 'Cooking', 10),
('Barefoot Contessa: How Easy Is That?', 1013, '978-0-77-043704-0', '2010-01-01', 'Cooking', 10),
('Barefoot Contessa Foolproof', 1013, '978-0-77-043459-9', '2012-01-01', 'Cooking', 10),
('Barefoot Contessa: Make It Ahead', 1013, '978-0-77-043492-6', '2014-01-01', 'Cooking', 10),
('Cooking for Jeffrey: A Barefoot Contessa Cookbook', 1013, '978-0-45-149579-5', '2016-01-01', 'Cooking', 10),
('Barefoot Contessa: Cook Like a Pro', 1013, '978-0-80-418704-6', '2018-01-01', 'Cooking', 10),
('Modern Comfort Food: A Barefoot Contessa Cookbook', 1013, '978-0-80-418706-0', '2020-01-01', 'Cooking', 10),
('Ina Garten: The Barefoot Contessa Cookbook (Special Edition)', 1013, '978-0-60-981462-7', '2004-01-01', 'Cooking', 10),
('Ina Garten: Make It Ahead: A Barefoot Contessa Cookbook', 1013, '978-0-77-984935-3', '2014-01-01', 'Cooking', 10),
('Ina Garten: Cooking for Jeffrey: A Barefoot Contessa Cookbook',1013, '978-0-45-149579-5', '2016-01-01', 'Cooking', 10),
('Ina Garten: Modern Comfort Food: A Barefoot Contessa Cookbook', 1013, '978-0-80-418706-0', '2020-01-01', 'Cooking', 10);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('The Naked Chef', 1017, '978-0-14-026670-1', '1999-01-01', 'Cooking', 10),
('The Return of the Naked Chef', 1017, '978-0-14-029801-6', '2000-01-01', 'Cooking', 10),
('Happy Days with the Naked Chef', 1017, '978-1-40-130013-6', '2002-01-01', 'Cooking', 10),
('Jamie''s Kitchen', 1017, '978-0-14-029449-0', '2002-01-01', 'Cooking', 10),
('Jamie''s Dinners', 1017, '978-1-40-132242-8', '2004-01-01', 'Cooking', 10),
('Jamie''s Italy', 1017, '978-1-40-130195-9', '2005-01-01', 'Cooking', 10),
('Cook with Jamie', 1017, '978-1-40-132242-8', '2006-01-01', 'Cooking', 10),
('Jamie at Home', 1017, '978-1-40-132242-8', '2007-01-01', 'Cooking', 10),
('Ministry of Food', 1017, '978-1-40-132242-8', '2008-01-01', 'Cooking', 10),
('Jamie''s America', 1017, '978-1-40-132242-8', '2009-01-01', 'Cooking', 10),
('Jamie''s 30-Minute Meals', 1017, '978-1-40-132242-8', '2010-01-01', 'Cooking', 10),
('Jamie Does...', 1017, '978-1-40-132242-8', '2010-01-01', 'Cooking', 10),
('Jamie''s Great Britain', 1017, '978-1-40-132242-8', '2011-01-01', 'Cooking', 10),
('Jamie''s Comfort Food', 1017, '978-1-40-132242-8', '2014-01-01', 'Cooking', 10),
('Everyday Super Food', 1017, '978-0-71-818123-9', '2015-01-01', 'Cooking', 10),
('Jamie Oliver''s Christmas Cookbook', 1017, '978-1-40-100496-4', '2016-01-01', 'Cooking', 10),
('5 Ingredients: Quick & Easy Food', 1017, '978-1-40-593220-3', '2017-01-01', 'Cooking', 10),
('Jamie Cooks Italy', 1017, '978-1-40-593258-6', '2018-01-01', 'Cooking', 10),
('Veg: Easy & Delicious Meals for Everyone', 1017, '978-1-40-593964-6', '2019-01-01', 'Cooking', 10),
('Together: Memorable Meals, Made Easy', 1017, '978-1-40-593352-1', '2020-01-01', 'Cooking', 10),
('7 Ways: Easy Ideas for Every Day of the Week', 1017, '978-0-24-143115-3', '2020-01-01', 'Cooking', 10),
('Jamie Oliver: The Biography', 1017, '978-1-78-606469-5', '2019-01-01', 'Biography', 4);


INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('Everyday Italian', 1010, '978-1-40-005258-6', '2005-01-01', 'Cooking', 10),
('Giada''s Family Dinners', 1010, '978-1-40-005258-6', '2006-01-01', 'Cooking', 10),
('Everyday Pasta', 1010, '978-0-30-734097-4', '2007-01-01', 'Cooking', 10),
('Giada''s Kitchen: New Italian Favorites', 1010, '978-0-30-734000-4', '2008-01-01', 'Cooking', 10),
('Giada at Home', 1010, '978-0-30-745101-2', '2010-01-01', 'Cooking', 10),
('Weeknights with Giada', 1010, '978-0-30-745102-9', '2012-01-01', 'Cooking', 10),
('Giada''s Feel Good Food', 1010, '978-0-30-798721-4', '2013-01-01', 'Cooking, Healthy Eating', 10),
('Happy Cooking', 1010, '978-0-30-798722-1', '2015-01-01', 'Cooking', 10),
('Giada''s Italy', 1010, '978-0-30-798722-1', '2018-01-01', 'Cooking', 10),
('Giada''s Feel Good Food: My Healthy Recipes and Secrets', 1010, '978-0-30-798722-1', '2013-01-01', 'Cooking', 10),
('Giada''s Italy: My Recipes for La Dolce Vita', 1010, '978-0-30-798722-1', '2018-01-01', 'Cooking', 10),
('Giada at Home: Family Recipes from Italy and California', 1010, '978-0-30-734659-4', '2010-01-01', 'Cooking', 10),
('Giada''s Family Dinners: Recipes from Italy and California', 1010, '978-0-30-734659-4', '2006-01-01', 'Cooking', 10),
('Giada''s Feel Good Food: My Healthy Recipes and Secrets', 1010, '978-0-30-798721-4', '2013-01-01', 'Cooking', 10),
('Giada''s Italy: My Recipes for La Dolce Vita', 1010, '978-0-30-798722-1', '2018-01-01', 'Cooking', 10);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('How to Eat', 1026, '978-0-47-052528-4', '1998-01-01', 'Cooking', 10),
('How to Be a Domestic Goddess', 1026, '978-0-701-17255-8', '2000-01-01', 'Baking', 3),
('Nigella Summer', 1026, '978-0-701-17755-3', '2002-01-01', 'Cooking', 10),
('Forever Summer', 1026, '978-0-701-17754-6', '2002-01-01', 'Cooking', 10),
('Feast', 1026, '978-0-701-17857-4', '2004-01-01', 'Cooking', 10),
('Nigella Express', 1026, '978-0-701-17858-1', '2007-01-01', 'Cooking', 10),
('Nigella Christmas', 1026, '978-0-701-17887-1', '2008-01-01', 'Cooking', 10),
('Kitchen: Recipes from the Heart of Home', 1026, '978-1-40-591353-5', '2010-01-01', 'Cooking', 10),
('Nigellissima: Instant Italian Inspiration', 1026, '978-0-701-17751-5', '2012-01-01', 'Cooking', 10),
('Simply Nigella: Feel Good Food', 1026, '978-0-701-17949-6', '2015-01-01', 'Cooking', 10),
('At My Table: A Celebration of Home Cooking', 1026, '978-1-47-132586-9', '2017-01-01', 'Cooking', 10),
('Cook, Eat, Repeat: Ingredients, Recipes, and Stories', 1026, '978-1-47-352969-2', '2020-01-01', 'Cooking', 10),
('Nigella Bites: From Family Meals to Elegant Dinners Easy, Delectable Recipes', 1026, '978-1-40-130136-2', '2002-01-01', 'Cooking', 10),
('Nigella Lawson: A Biography', 1026, '978-1-50-989243-3', '2020-01-01', 'Biography', 4);


INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('100 Great Breads', 1030, '978-1-40-536711-0', '2004-01-01', 'Baking', 3),
('How to Bake', 1030, '978-1-40-536352-5', '2012-01-01', 'Baking', 3),
('Paul Hollywood''s Bread', 1030, '978-1-40-884069-1', '2013-01-01', 'Baking', 3),
('Paul Hollywood''s Pies and Puds', 1030, '978-1-40-884067-7', '2013-01-01', 'Baking', 3),
('Paul Hollywood''s British Baking', 1030, '978-1-40-884069-1', '2014-01-01', 'Baking', 3),
('Paul Hollywood''s Bread Baking', 1030, '978-1-47-361534-8', '2017-01-01', 'Baking', 3),
('A Baker''s Life: 100 Fantastic Recipes', 1030, '978-1-40-884648-5', '2017-01-01', 'Baking', 3),
('The Weekend Baker', 1030, '978-1-40-884069-1', '2016-01-01', 'Baking', 3),
('Paul Hollywood: The Biography', 1030, '978-1-78-219962-5', '2013-01-01', 'Biography', 4),
('Paul Hollywood: A Baker''s Life', 1030, '978-1-40-884648-5', '2017-01-01', 'Autobiography',2 );

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('Entertaining', 1023, '978-0-51-758574-3', '1982-01-01', 'Lifestyle', 20),
('Martha Stewart''s Quick Cook', 1023, '978-0-51-757702-1', '1983-01-01', 'Cooking', 10),
('Martha Stewart''s Hors d''Oeuvres', 1023, '978-0-39-472221-2', '1984-01-01', 'Cooking', 10),
('Weddings', 1023, '978-0-51-757222-4', '1987-01-01', 'Lifestyle', 20),
('Pies & Tarts', 1023, '978-0-39-456137-0', '1985-01-01', 'Baking', 3),
('Quick Cook', 1023, '978-0-39-472093-5', '1987-01-01', 'Cooking', 10),
('Christmas', 1023, '978-0-84-650867-0', '1989-01-01', 'Lifestyle', 20),
('Quick Cook Menus', 1023, '978-0-39-457321-3', '1990-01-01', 'Cooking', 10),
('Martha Stewart''s Gardening Month by Month', 1023, '978-0-60-960825-8', '1991-01-01', 'Gardening', 17),
('Martha Stewart''s Quick Cook Menus', 1023, '978-0-39-457322-0', '1991-01-01', 'Cooking', 10),
('Martha Stewart''s Christmas', 1023, '978-0-84-650883-0', '1991-01-01', 'Lifestyle, Cooking', 10),
('Good Things for Easy Entertaining', 1023, '978-1-58-479419-0', '1993-01-01', 'Lifestyle', 20),
('Martha Stewart Living Annual Recipes 2003', 1023, '978-0-84-876171-4', '2003-01-01', 'Cooking', 10),
('Martha Stewart''s New Pies and Tarts', 1023, '978-0-30-740509-8', '2011-01-01', 'Baking', 3),
('Martha Stewart''s Cooking School', 1023, '978-0-30-739644-0', '2008-01-01', 'Cooking', 10),
('Martha Stewart''s Cakes', 1023, '978-0-30-795434-3', '2013-01-01', 'Baking', 3),
('Martha Stewart''s Appetizers', 1023, '978-0-30-795448-0', '2015-01-01', 'Cooking', 10),
('Martha Stewart''s Vegetables', 1023, '978-0-30-795445-9', '2016-01-01', 'Cooking', 10),
('Martha Stewart''s Slow Cooker', 1023, '978-0-30-795460-2', '2017-01-01', 'Cooking', 10),
('Martha Stewart''s Pressure Cooker', 1023, '978-0-30-795457-2', '2018-01-01', 'Cooking', 10),
('Martha''s Flowers: A Practical Guide to Growing, Gathering, and Enjoying', 1023, '978-0-84-786215-9', '2018-01-01', 'Gardening', 17),
('Martha Stewart''s Cookie Perfection', 1023, '978-0-35-835376-2', '2019-01-01', 'Baking', 3),
('Martha Stewart''s Grilling: 125+ Recipes for Gatherings Large and Small', 1023, '978-1-98-482436-6', '2019-01-01', 'Cooking', 10),
('Organizing From the Inside Out', 1023, '978-0-80-508028-0', '1997-01-01', 'Lifestyle', 20),
('The Martha Rules: 10 Essentials for Achieving Success as You Start, Build, or Manage a Business', 1023, '978-1-40-006505-9', '2005-01-01', 'Lifestyle', 20),
('Martha Stewart''s Dinner at Home', 1023, '978-0-30-739646-4', '2009-01-01', 'Cooking', 10),
('The Martha Stewart Living Cookbook', 1023, '978-0-84-876143-1', '2000-01-01', 'Cooking', 10),
('Martha Stewart''s Baking Handbook', 1023, '978-0-30-723672-2', '2005-01-01', 'Baking', 3),
('Martha Stewart''s Homekeeping Handbook', 1023, '978-0-30-739666-2', '2006-01-01', 'Lifestyle', 20),
('Martha Stewart''s Cooking School: Lessons and Recipes for the Home Cook', 1023, '978-0-30-746145-5', '2008-01-01', 'Cooking', 10),
('Martha Stewart''s Encyclopedia of Crafts: An A-to-Z Guide with Detailed Instructions and Endless Inspiration', 1023, '978-0-60-980551-9', '2012-01-01', 'Crafts', 11);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('Roasting in Hell''s Kitchen', 1011, '978-0-00-735095-0', '2006-01-01', 'Autobiography', 2),
('Gordon Ramsay''s Fast Food', 1011, '978-1-84-400453-8', '2007-01-01', 'Cooking', 10),
('Gordon Ramsay''s Three-Star Chef', 1011, '978-1-40-279927-9', '2008-01-01', 'Cooking', 10),
('Gordon Ramsay''s Healthy Appetite', 1011, '978-1-84-949958-8', '2008-01-01', 'Cooking', 10),
('Gordon Ramsay''s Cooking for Friends', 1011, '978-0-00-726705-5', '2008-01-01', 'Cooking', 10),
('Gordon Ramsay''s Great British Pub Food', 1011, '978-0-00-724772-9', '2009-01-01', 'Cooking', 10),
('Gordon Ramsay''s World Kitchen', 1011, '978-0-00-728982-0', '2009-01-01', 'Cooking', 10),
('Gordon Ramsay''s Best Menus', 1011, '978-0-00-739142-7', '2010-01-01', 'Cooking', 10),
('Gordon Ramsay''s Sunday Lunch', 1011, '978-0-00-735846-8', '2011-01-01', 'Cooking', 10),
('Gordon Ramsay''s Home Cooking', 1011, '978-1-47-365228-2', '2013-01-01', 'Cooking', 10),
('Gordon Ramsay''s Ultimate Home Cooking', 1011, '978-0-00-743584-8', '2013-01-01', 'Cooking', 10),
('Gordon Ramsay''s Ultimate Cookery Course', 1011, '978-1-47-365227-5', '2012-01-01', 'Cooking', 10),
('Gordon Ramsay''s Ultimate Fit Food', 1011, '978-0-00-828831-1', '2018-01-01', 'Cooking', 10),
('Bread Street Kitchen', 1011, '978-1-47-365227-5', '2016-01-01', 'Cooking', 10),
('Gordon Ramsay''s Quick & Delicious', 1011, '978-0-00-818708-1', '2019-01-01', 'Cooking', 10),
('Gordon Ramsay''s Home Christmas', 1011, '978-1-47-369056-7', '2019-01-01', 'Cooking', 10),
('Gordon Ramsay Quick & Delicious', 1011, '978-0-00-833373-6', '2020-01-01', 'Cooking', 10),
('Ramsay in 10', 1011, '978-1-45-552569-3', '2021-01-01', 'Cooking', 10),
('Gordon Ramsay''s How to Cook: Step-by-Step Guide', 1011, '978-0-600-63276-4', '2022-01-01', 'Cooking', 10);


INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('The French Laundry Cookbook', 1034, '978-1-57-965126-8', '1999-01-01', 'Cooking', 10),
('Bouchon', 1034, '978-1-57-965239-5', '2004-01-01', 'Cooking', 10),
('Under Pressure: Cooking Sous Vide', 1034, '978-1-57-965351-4', '2008-01-01', 'Cooking', 10),
('Ad Hoc at Home', 1034, '978-1-57-965377-4', '2009-01-01', 'Cooking', 10),
('Bouchon Bakery', 1034, '978-1-57-965435-1', '2012-01-01', 'Baking, Cooking', 10),
('The French Laundry, Per Se', 1034, '978-1-57-965439-9', '2011-01-01', 'Cooking', 10),
('You''re Doing It All Wrong: The Best Cooking Mistakes and How to Fix Them', 1034, '978-1-57-965597-6', '2016-01-01', 'Cooking', 10),
('The French Laundry, Per Se (Revised Edition)', 1034, '978-1-60-774753-4', '2020-01-01', 'Cooking', 10);


INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('Looking for Alaska', 1021, '978-0-14-240251-1', '2005-01-01', 'Young Adult', 31),
('An Abundance of Katherines', 1021, '978-0-14-241070-2', '2006-01-01', 'Young Adult', 31),
('Paper Towns', 1021, '978-0-14-241493-9', '2008-01-01', 'Young Adult', 31),
('Will Grayson, Will Grayson', 1021, '978-0-14-241847-0', '2010-01-01', 'Young Adult', 31),
('The Fault in Our Stars', 1021, '978-0-14-242417-9', '2012-01-01', 'Young Adult', 31),
('Turtles All the Way Down', 1021, '978-0-52-555536-0', '2017-01-01', 'Young Adult', 31),
('Let It Snow (with Maureen Johnson and Lauren Myracle)', 1021, '978-0-14-241214-0', '2008-01-01', 'Young Adult', 31);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('Benny and Omar', 1008, '978-0-14-130822-1', '1998-01-01', 'Adventure', 1),
('Benny and Babe', 1008, '978-0-14-130823-8', '1999-01-01', 'Adventure', 1),
('Benny and the Dreamers', 1008, '978-0-14-130824-5', '1999-01-01', 'Adventure', 1),
('Going Potty', 1008, '978-0-14-130825-2', '1999-01-01', 'Adventure', 1),
('The Wish List', 1008, '978-0-14-131592-2', '2000-01-01', 'Fantasy', 15),
('Ed''s Funny Feet', 1008, '978-0-14-130826-9', '2000-01-01', 'Adventure', 1),
('Ed''s Bed', 1008, '978-0-14-130827-6', '2001-01-01', 'Adventure', 1),
('Ed''s Funny Feet', 1008, '978-0-14-130828-3', '2001-01-01', 'Adventure', 1),
('The Supernaturalist', 1008, '978-0-14-131828-2', '2004-01-01', 'Adventure', 1),
('Artemis Fowl', 1008, '978-0-78-681787-0', '2001-01-01', 'Adventure', 1),
('Artemis Fowl: The Arctic Incident', 1008, '978-0-78-681653-8', '2002-01-01', 'Adventure', 1),
('Artemis Fowl: The Eternity Code', 1008, '978-0-78-681706-1', '2003-01-01', 'Adventure', 1),
('Artemis Fowl: The Opal Deception', 1008, '978-0-78-685289-5', '2005-01-01', 'Adventure', 1),
('Artemis Fowl: The Lost Colony', 1008, '978-0-78-684956-7', '2006-01-01', 'Adventure', 1),
('Artemis Fowl: The Time Paradox', 1008, '978-0-78-684956-7', '2008-01-01', 'Adventure', 1),
('Airman', 1008, '978-0-78-684792-1', '2008-01-01', 'Adventure', 1),
('Artemis Fowl: The Atlantis Complex', 1008, '978-1-40-632229-1', '2010-01-01', 'Adventure', 1),
('Artemis Fowl: The Last Guardian', 1008, '978-1-40-832636-1', '2012-01-01', 'Adventure', 1),
('Plugged', 1008, '978-1-40-882207-9', '2011-01-01', 'Crime', 12),
('Screwed', 1008, '978-1-40-882481-3', '2013-01-01', 'Crime', 12),
('The Reluctant Assassin (W.A.R.P. #1)', 1008, '978-1-42-316162-7', '2013-01-01', 'Adventure', 1),
('The Hangman''s Revolution (W.A.R.P. #2)', 1008, '978-1-42-316163-4', '2014-01-01', 'Adventure', 1),
('The Forever Man (W.A.R.P. #3)', 1008, '978-1-42-316164-1', '2015-01-01', 'Adventure', 1),
('Highfire', 1008, '978-0-06-293855-1', '2020-01-01', 'Adventure', 1),
('The Fowl Twins', 1008, '978-1-36-802432-2', '2019-01-01', 'Adventure', 1),
('The Fowl Twins: Deny All Charges', 1008, '978-1-36-806160-0', '2020-01-01', 'Adventure', 1),
('The Fowl Twins: Big Trouble', 1008, '978-1-36-804120-6', '2020-01-01', 'Adventure', 1),
('The Fowl Twins Get What They Deserve', 1008, '978-1-36-805213-4', '2021-01-01', 'Adventure', 1);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('The 21 Irrefutable Laws of Leadership', 1020, '978-0-78-528935-7', '1998-01-01', 'Leadership', 19),
('Developing the Leader Within You', 1020, '978-0-78-526666-2', '1993-01-01', 'Leadership', 19),
('The 5 Levels of Leadership', 1020, '978-1-40-020327-1', '2011-01-01', 'Leadership', 19),
('The 360 Degree Leader', 1020, '978-0-78-526092-9', '2005-01-01', 'Leadership', 19),
('Leadership Gold', 1020, '978-0-78-528879-4', '2008-01-01', 'Leadership', 19),
('How Successful People Think', 1020, '978-1-60-994269-7', '2009-01-01', 'Personal Development', 24),
('Failing Forward', 1020, '978-0-78-526430-9', '2000-01-01', 'Personal Development', 24),
('The Maxwell Daily Reader', 1020, '978-0-78-526684-6', '2011-01-01', 'Personal Development', 24),
('Make Today Count', 1020, '978-0-78-526467-5', '2008-01-01', 'Personal Development', 24),
('The 15 Invaluable Laws of Growth', 1020, '978-1-60-810131-4', '2012-01-01', 'Personal Development', 24),
('Everyone Communicates, Few Connect', 1020, '978-0-78-521425-0', '2010-01-01', 'Communication', 9),
('Intentional Living', 1020, '978-1-45-554814-6', '2015-01-01', 'Personal Development', 24),
('The 17 Indisputable Laws of Teamwork',1020, '978-0-78-527434-6', '2001-01-01', 'Leadership', 19),
('Your Road Map for Success', 1020, '978-0-78-528901-2', '2008-01-01', 'Leadership', 19),
('Good Leaders Ask Great Questions', 1020, '978-1-45-554809-2', '2014-01-01', 'Leadership', 19),
('Put Your Dream to the Test', 1020, '978-1-60-810264-9', '2009-01-01', 'Personal Development', 24),
('Winning with People', 1020, '978-0-78-527322-6', '2004-01-01', 'Relationships', 25),
('The Power of Your Potential', 1020, '978-1-47-897273-1', '2017-01-01', 'Personal Development', 24),
('The Difference Maker', 1020, '978-0-78-528881-7', '2014-01-01', 'Personal Development', 24),
('Beyond Talent', 1020, '978-1-41-855142-6', '2011-01-01', 'Personal Development', 24);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('How to Win Friends and Influence People', 1002, '978-0-67-102703-2', '1936-01-01', 'Self-Help', 27),
('How to Stop Worrying and Start Living', 1002, '978-0-67-173335-3', '1948-01-01', 'Self-Help', 27),
('The Quick and Easy Way to Effective Speaking', 1002, '978-0-671-02750-6', '1962-01-01', 'Communication', 9),
('How to Enjoy Your Life and Your Job', 1002, '978-0-671-21454-8', '1985-01-01', 'Self-Help', 27),
('Lincoln the Unknown', 1002, '978-0-671-66241-3', '1932-01-01', 'Biography', 4),
('Dale Carnegie''s Scrapbook', 1002, '978-0-14-023885-0', '1994-01-01', 'Self-Help', 27),
('Public Speaking: The Standard Course', 1002, '978-1-10-190501-9', '2011-01-01', 'Communication', 9),
('The Leader in You', 1002, '978-0-67-179998-3', '1990-01-01', 'Self-Help', 27),
('Little Known Facts About Well Known People', 1002, '978-0-87223-895-0', '1934-01-01', 'Biography', 4),
('Dale Carnegie''s Lifetime Plan for Success', 1002, '978-0-671-72911-6', '1960-01-01', 'Self-Help', 27),
('Art of Public Speaking', 1002, '978-0-48-643965-9', '2004-01-01', 'Communication', 9),
('The Art of Public Speaking and Communication', 1002, '978-9-88-054427-8', '2011-01-01', 'Communication', 9),
('Public Speaking Mastery', 1002, '978-0-15-572234-6', '1988-01-01', 'Communication', 9),
('The Quick and Easy Way to Effective Speaking', 1002, '978-0-671-02750-6', '1962-01-01', 'Communication', 9),
('Public Speaking: A Practical Course for Business Men', 1002, '978-1-17-780660-3', '2019-01-01', 'Communication', 9),
('The Dale Carnegie Course on Effective Speaking', 1002, '978-0-671-63120-3', '1970-01-01', 'Communication', 9),
('How to Develop Self-Confidence and Influence People', 1002, '978-0-671-03266-3', '1984-01-01', 'Self-Help', 27),
('Public Speaking for Success', 1002, '978-1-91-666977-1', '2018-01-01', 'Communication', 9),
('Five Minute Biographies', 1002, '978-0-80-079445-1', '2017-01-01', 'Biography', 4),
('How to Communicate Effectively', 1002, '978-0-671-62036-6', '1985-01-01', 'Communication', 9);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
('The Power of Now', 1007, '978-1-57-731480-6', '1997-01-01', 'Spirituality', 28),
('A New Earth', 1007, '978-0-52-595075-9', '2005-01-01', 'Spirituality', 28),
('Practicing the Power of Now', 1007, '978-1-58-731390-9', '2001-01-01', 'Spirituality', 28),
('Stillness Speaks', 1007, '978-1-60-868181-4', '2003-01-01', 'Spirituality', 28),
('Guardians of Being', 1007, '978-1-60-868119-7', '2009-01-01', 'Spirituality', 28),
('Oneness with All Life', 1007, '978-0-52-594939-5', '2008-01-01', 'Spirituality', 28),
('The Flowering of Human Consciousness', 1007, '978-1-60-868090-9', '2001-01-01', 'Spirituality', 28),
('Stillness Speaks Cards', 1007, '978-1-40-190623-8', '2003-01-01', 'Spirituality', 28),
('The Eckhart Tolle Audio Collection', 1007, '978-1-59-179001-8', '2005-01-01', 'Spirituality', 28),
('Guardians of Being Cards', 1007, '978-1-60-868029-9', '2009-01-01', 'Spirituality', 28),
('Milton''s Secret', 1007, '978-1-57-731671-8', '2008-01-01', 'Fiction, Spirituality', 28),
('Eckhart Tolle''s Findhorn Retreat: Stillness Amidst the World', 1007, '978-1-59-179238-8', '2002-01-01', 'Spirituality', 28),
('Eckhart Tolle''s Music to Quiet the Mind', 1007, '978-1-60-407407-9', '2008-01-01', 'Music, Spirituality', 28),
('Freedom from the World', 1007, '978-1-60-868033-6', '2018-01-01', 'Spirituality', 28),
('The Realization of Being', 1007, '978-1-60-407431-4', '2010-01-01', 'Spirituality', 28),
('The Art of Presence', 1007, '978-1-60-407856-5', '2017-01-01', 'Spirituality', 28),
('Living the Liberated Life and Dealing with the Pain-Body', 1007, '978-1-60-407840-4', '2015-01-01', 'Spirituality', 28),
('Entering the Now: The Power of Now Teaching Series', 1007, '978-1-59-179348-4', '2008-01-01', 'Spirituality', 28),
('Beyond the Thinking Mind', 1007, '978-1-60-407893-0', '2010-01-01', 'Spirituality', 28);

INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID ) VALUES
-- Percy Jackson & the Olympians Series
('The Lightning Thief', 1031, '978-0-14-133832-6', '2005-01-01', 'Mythology', 23),
('The Sea of Monsters', 1031, '978-0-14-131914-2', '2006-01-01', 'Mythology', 23),
('The Titan''s Curse', 1031, '978-0-14-132126-8', '2007-01-01', 'Mythology', 23),
('The Battle of the Labyrinth', 1031, '978-0-14-132127-5', '2008-01-01', 'Mythology', 23),
('The Last Olympian', 1031, '978-0-14-132128-2', '2009-01-01', 'Mythology', 23),
-- The Heroes of Olympus Series
('The Lost Hero', 1031, '978-1-41-311771-8', '2010-01-01', 'Mythology', 23),
('The Son of Neptune', 1031, '978-1-41-311583-7', '2011-01-01', 'Mythology', 23),
('The Mark of Athena', 1031, '978-1-41-587345-8', '2012-01-01', 'Mythology', 23),
('The House of Hades', 1031, '978-1-41-765712-8', '2013-01-01', 'Mythology', 23),
('The Blood of Olympus', 1031, '978-1-41-954153-0', '2014-01-01', 'Mythology', 23),
-- The Trials of Apollo Series
('The Hidden Oracle', 1031, '978-1-48-473274-8', '2016-01-01', 'Mythology', 23),
('The Dark Prophecy', 1031, '978-1-48-474642-4', '2017-01-01', 'Mythology', 23),
('The Burning Maze', 1031, '978-1-48-474643-1', '2018-01-01', 'Mythology', 23),
('The Tyrant''s Tomb', 1031, '978-1-48-474696-7', '2019-01-01', 'Mythology', 23),
('The Tower of Nero', 1031, '978-1-48-474645-5', '2020-01-01', 'Mythology', 23),
-- The Kane Chronicles Series
('The Red Pyramid', 1031, '978-1-42-311338-6', '2010-01-01', 'Mythology', 23),
('The Throne of Fire', 1031, '978-1-42-311339-3', '2011-01-01','Mythology', 23 ),
('The Serpent''s Shadow', 1031, '978-1-42-314201-0', '2012-01-01', 'Mythology', 23),
-- Magnus Chase and the Gods of Asgard Series
('The Sword of Summer', 1031, '978-1-48-471932-9', '2015-01-01', 'Mythology', 23),
('The Hammer of Thor', 1031, '978-1-48-471506-2', '2016-01-01', 'Mythology', 23),
('The Ship of the Dead', 1031, '978-1-48-471670-0', '2017-01-01', 'Mythology', 23),
-- The Trials of Apollo / Magnus Chase Crossover
('The Tower of Nero', 1031, '978-1-48-474645-5', '2020-01-01', 'Mythology', 23),
-- Tres Navarre Series
('Big Red Tequila', 1031, '978-0-06-109918-7', '1997-01-01', 'Crime', 12),
('The Widower''s Two-Step', 1031, '978-0-06-109975-0', '1998-01-01', 'Crime', 12),
('The Last King of Texas', 1031, '978-0-06-109977-4', '2000-01-01', 'Crime', 12),
('The Devil Went Down to Austin', 1031, '978-0-06-109978-1', '2001-01-01', 'Crime', 12),
('Southtown', 1031, '978-0-06-109983-5', '2004-01-01', 'Crime', 12),
('Mission Road', 1031, '978-0-06-057472-6', '2005-01-01', 'Crime', 12),
('Rebel Island', 1031, '978-0-06-057513-6', '2007-01-01', 'Crime', 12),
-- The Storm Runner Series
('The Storm Runner', 1031, '978-1-36-800538-3', '2018-01-01', 'Mythology', 23),
('The Fire Keeper', 1031, '978-1-36-800537-6', '2019-01-01', 'Mythology', 23),
('The Shadow Crosser', 1031, '978-1-36-800536-9', '2020-01-01', 'Mythology', 23),
('9 from the Nine Worlds (Magnus Chase companion)', 1031, '978-1-36-804060-5', '2018-01-01', 'Mythology', 23);

SELECT COUNT(BookID) AS NumberOfBooks
FROM Books;

SELECT
    AuthorID,
    AVG(NumberOfBooks) AS AverageBooksPerAuthor
FROM (
    -- Subquery to count the number of books per author
    SELECT
        AuthorID,
        COUNT(BookID) AS NumberOfBooks
    FROM Books
    GROUP BY AuthorID
) AS BookCounts
GROUP BY AuthorID;

SELECT TOP 10
    AuthorID, 
    COUNT(BookID) AS NumberOfBooks
FROM Books
GROUP BY AuthorID
ORDER BY NumberOfBooks DESC;

SELECT TOP 10
    A.AuthorID,
    A.AuthorName,
    COUNT(B.BookID) AS NumberOfBooks
FROM Authors A
JOIN Books B ON A.AuthorID = B.AuthorID
GROUP BY A.AuthorID, A.AuthorName
ORDER BY NumberOfBooks DESC;

SELECT * FROM Books 

SELECT GenreName, COUNT(*) AS NumberOfBooks
FROM Books
GROUP BY GenreName;

-- Inserting data into Users Table
INSERT INTO Users (UserName, ContactNumber) VALUES
    ('John Smith', '09123456789'),
    ('Emily Johnson', '09234567890'),
    ('Michael Davis', '09345678901'),
    ('Sarah Taylor', '09456789012'),
    ('David Brown', '09567890123'),
    ('Jessica Wilson', '09678901234'),
    ('Christopher White', '09789012345'),
    ('Amanda Miller', '09890123456'),
    ('Daniel Anderson', '09901234567'),
    ('Olivia Martinez', '09112345678'),
    ('Matthew Robinson', '09223456789'),
    ('Sophia Harris', '09334567890'),
    ('Ethan Turner', '09445678901'),
    ('Isabella Thompson', '09556789012'),
    ('Andrew Lee', '09667890123'),
    ('Madison Clark', '09778901234'),
    ('Nicholas Lewis', '09889012345'),
    ('Abigail Hall', '09990123456'),
    ('Jacob Wright', '09101234567'),
    ('Ava King', '09212345678'),
    ('Alexander Garcia', '09323456789'),
    ('Mia Davis', '09434567890'),
    ('William Moore', '09545678901'),
    ('Emma Johnson', '09656789012'),
    ('Christopher Martin', '09767890123'),
    ('Grace Taylor', '09878901234'),
    ('James Anderson', '09989012345'),
    ('Lily Wilson', '09190123456'),
    ('Benjamin Smith', '09201234567'),
    ('Sofia Brown', '09312345678'),
    ('Jackson Thomas', '09423456789'),
    ('Scarlett Miller', '09534567890'),
    ('Samuel White', '09645678901'),
    ('Zoey Harris', '09756789012'),
    ('Nathan Robinson', '09867890123'),
    ('Addison Clark', '09978901234'),
    ('Ryan Thompson', '09189012345'),
    ('Avery Lee', '09290123456'),
    ('Victoria Turner', '09301234567'),
    ('Dylan Martinez', '09412345678'),
    ('Layla Wright', '09523456789'),
    ('Elijah Hall', '09634567890'),
    ('Aria King', '09745678901'),
    ('Caleb Lewis', '09856789012'),
    ('Stella Wright', '09967890123'),
    ('Gabriel Moore', '09178901234'),
    ('Chloe Davis', '09289012345'),
    ('Daniel Johnson', '09390123456'),
    ('Harper Garcia', '09401234567'),
    ('Oliver Smith', '09512345678');

SELECT * FROM Users     

ALTER TABLE Loans
ADD CONSTRAINT FK_Books_BookID FOREIGN KEY (BookID) REFERENCES Books(BookId);

INSERT INTO Loans (BookID, UserID, LoanDate, ReturnDate)
VALUES 
(3001, 101, '2023-01-05', '2023-01-10'),
(3002, 102, '2023-02-12', '2023-02-20'),
(3003, 103, '2023-03-20', '2023-03-28');

-- Additional loan data
INSERT INTO Loans (BookID, UserID, LoanDate, ReturnDate)
VALUES 
(3004, 104, '2023-04-02', '2023-04-09'),
(3005, 105, '2023-05-15', '2023-05-22'),
(3006, 106, '2023-06-10', '2023-06-17');

SELECT * FROM Loans 

-- Declare variables
DECLARE @StartDate DATE = '2023-01-01';
DECLARE @EndDate DATE = '2023-12-31';

INSERT INTO Loans (BookID, UserID, LoanDate, ReturnDate)
SELECT
    RandomBooks.BookId,
    RandomUsers.UserID,
    DATEADD(DAY, ABS(CHECKSUM(NEWID())) % DATEDIFF(DAY, '2023-01-01', '2023-12-31'), '2023-01-01') AS LoanDate,
    DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 10 + 1, DATEADD(DAY, ABS(CHECKSUM(NEWID())) % DATEDIFF(DAY, '2023-01-01', '2023-12-31'), '2023-01-01')) AS ReturnDate
FROM 
    (SELECT TOP 200 BookId FROM Books ORDER BY NEWID()) AS RandomBooks
CROSS JOIN 
    (SELECT UserID FROM Users) AS RandomUsers;

-- Check the first few rows to verify
SELECT TOP 10 * FROM Loans ORDER BY LoanID DESC;

SELECT * FROM Loans 

-- Check the total number of loans
SELECT COUNT(*) AS TotalLoans
FROM Loans;

-- Check the number of distinct loans
SELECT COUNT(*) AS DistinctLoans
FROM (
    SELECT DISTINCT BookID, UserID, LoanDate, ReturnDate
    FROM Loans
) AS DistinctLoanSubquery;

-- Duplicate 35% of the existing loans
INSERT INTO Loans (BookID, UserID, LoanDate, ReturnDate)
SELECT TOP 35 PERCENT
    BookID,
    UserID,
    LoanDate,
    ReturnDate
FROM Loans
ORDER BY NEWID();

-- Check for repeated loans
SELECT BookID, UserID, LoanDate, ReturnDate, COUNT(*) AS RepeatedCount
FROM Loans
GROUP BY BookID, UserID, LoanDate, ReturnDate
HAVING COUNT(*) > 1;

-- Check the total number of repeated loans
SELECT COUNT(*) AS TotalRepeatedLoans
FROM (
    SELECT BookID, UserID, LoanDate, ReturnDate
    FROM Loans
    GROUP BY BookID, UserID, LoanDate, ReturnDate
    HAVING COUNT(*) > 1
) AS RepeatedLoans;

-- Check the top BookID loaned multiple times
SELECT TOP 1 BookID, COUNT(*) AS LoanCount
FROM Loans
GROUP BY BookID
HAVING COUNT(*) > 1
ORDER BY LoanCount DESC;

-- Check the top 10 BookID loaned multiple times
SELECT TOP 10 BookID, COUNT(*) AS LoanCount
FROM Loans
GROUP BY BookID
HAVING COUNT(*) > 1
ORDER BY LoanCount DESC;

-- Check the top 1 UserID loaned multiple times
SELECT TOP 1 UserID, COUNT(*) AS LoanCount
FROM Loans
GROUP BY UserID
HAVING COUNT(*) > 1
ORDER BY LoanCount DESC;

-- Check the top UserID loaned multiple times
SELECT TOP 10 UserID, COUNT(*) AS LoanCount
FROM Loans
GROUP BY UserID
HAVING COUNT(*) > 1
ORDER BY LoanCount DESC;

-- Check the top 10 UserID loaned multiple times with username and book title
SELECT TOP 10
    L.UserID,
    U.UserName,
    B.BookTitle,
    COUNT(*) AS LoanCount
FROM
    Loans L
JOIN
    Users U ON L.UserID = U.UserID
JOIN
    Books B ON L.BookID = B.BookID
GROUP BY
    L.UserID, U.UserName, B.BookTitle
HAVING
    COUNT(*) > 1
ORDER BY
    LoanCount DESC;

-- Check the top 10 BookID loaned multiple times with book title and loan count
SELECT TOP 10
    L.BookID,
    B.BookTitle,
    COUNT(*) AS LoanCount
FROM
    Loans L
JOIN
    Books B ON L.BookID = B.BookID
GROUP BY
    L.BookID, B.BookTitle
HAVING
    COUNT(*) > 1
ORDER BY
    LoanCount DESC;

-- Check the top 10 BookID loaned multiple times with username, authorname, book title, and loan count
SELECT TOP 10
    L.BookID,
    B.BookTitle, 
    A.AuthorName, -- Assuming AuthorName is in the Authors table
    U.UserName,
    COUNT(*) AS LoanCount
FROM
    Loans L
JOIN
    Books B ON L.BookID = B.BookID
JOIN
    Authors A ON B.AuthorID = A.AuthorID -- Assuming there's an AuthorID column in Books referencing Authors
JOIN
    Users U ON L.UserID = U.UserID
GROUP BY
    L.BookID, B.BookTitle, A.AuthorName, U.UserName
HAVING
    COUNT(*) > 1
ORDER BY
    LoanCount DESC;

-- Check the top 10 BookID loaned multiple times with distinct username, authorname, book title, and loan count
SELECT TOP 10
    L.BookID,
    B.BookTitle,
    A.AuthorName, -- Assuming AuthorName is in the Authors table
    U.UserName,
    COUNT(DISTINCT L.UserID) AS DistinctUserCount,
    COUNT(*) AS LoanCount
FROM
    Loans L
JOIN
    Books B ON L.BookID = B.BookID
JOIN
    Authors A ON B.AuthorID = A.AuthorID -- Assuming there's an AuthorID column in Books referencing Authors
JOIN
    Users U ON L.UserID = U.UserID
GROUP BY
    L.BookID, B.BookTitle, A.AuthorName, U.UserName
HAVING
    COUNT(*) > 1
ORDER BY
    LoanCount DESC;

--------------------------------------------------------------------------------------------------------------------
--Update Data:
--Update the Loans table to change the ReturnDate for a specific LoanID:

-- Update ReturnDate for a specific LoanID
UPDATE Loans
SET ReturnDate = '2023-12-01'
WHERE LoanID = 5370;

-- View with a specific LoanId
SELECT *
FROM Loans 
WHERE LoanID = 1004;

SELECT * FROM Users 

-- Update contact number for a specific user
UPDATE Users 
SET ContactNumber  = '09345678902'
WHERE UserID = 103;


-- Delete a specific loan record
DELETE FROM Loans
WHERE LoanID = 1004;

-- Delete loans with LoanID in a certain range
DELETE FROM Loans
WHERE LoanID BETWEEN 11291 AND 21817;


-- Modify BookTitle for a specific BookID
UPDATE Books
SET BookTitle = 'The Hobbit, a journey begins'
WHERE BookID = 3001;

SELECT * FROM Loans 

-- Mark a book as returned by updating the return_date in Transactions
UPDATE Loans 
SET ReturnDate  = '2023-02-15'
WHERE LoanID  = 1005;

---------------------------------------------------------------------------------
--Search for Books:

-- Search for books by title
SELECT *
FROM Books
WHERE BookTitle LIKE '%the%';

-- Search for books by author's name
-- Select distinct rows with specific columns from the Books table along with the AuthorName where the author's name contains 'om'
SELECT DISTINCT Books.BookID, Books.BookTitle, Books.AuthorId, Authors.AuthorName
FROM Books
JOIN Authors ON Books.AuthorId = Authors.AuthorID 
WHERE Authors.AuthorName LIKE '%om%';

-- Search for books by genre
SELECT *
FROM Books
WHERE GenreName LIKE '%Baking%';

SELECT * FROM Loans 

--Retrieve Borrowing Information:

-- List books that are currently checked out along with user information
SELECT Books.BookTitle, Users.UserName, Loans.LoanDate, Loans.ReturnDate 
FROM Loans 
JOIN Books ON Loans.BookID = Books.BookId 
JOIN Users ON Loans.UserID = Users.UserID 
WHERE Loans.ReturnDate >= '2023-02-15' AND Loans.ReturnDate < '2023-06-10';

SELECT TOP 10 *
FROM Loans
WHERE Loans.ReturnDate >= '2023-02-15' AND Loans.ReturnDate < '2023-06-10';

-- List the borrowing history of a specific user
SELECT Books.BookTitle, Loans.LoanDate , Loans.ReturnDate
FROM Loans 
JOIN Books ON Loans.BookID = Books.BookId 
WHERE Loans.UserID  = 106;

--Aggregation and Statistics:

-- Count the number of books in each genre and arrange in descending order
SELECT GenreName, COUNT(*) AS book_count
FROM Books
GROUP BY GenreName
ORDER BY book_count DESC;

-- Find the most popular author based on the number of books
SELECT Authors.AuthorName, COUNT(*) as book_count
FROM Books
JOIN Authors ON Books.AuthorId  = Authors.AuthorID 
GROUP BY Authors.AuthorName 
ORDER BY book_count DESC

--Task 6: Implement Advanced Queries Description: Construct more advanced SQL queries for generating reports on borrowed books, overdue books, and popular book genres.
--Report on loaned books
-- List currently loaned books with user information
SELECT Books.BookTitle, Users.UserName, Loans.LoanDate, Loans.ReturnDate 
FROM Loans 
JOIN Books ON Loans.BookID = Books.BookId 
JOIN Users ON Loans.UserID = Users.UserID 
WHERE Loans.ReturnDate = '2023-06-10';

-- Count the number of books loaned by each user and arrange in descending order
SELECT Users.UserName, COUNT(*) AS books_loaned
FROM Loans 
JOIN Users  ON Loans.UserID = Users.UserID 
GROUP BY Users.UserName 
ORDER BY books_loaned  DESC;

-- List overdue books with user information
SELECT Books.BookTitle, Users.UserName, Loans.LoanDate, Loans.ReturnDate 
FROM Loans 
JOIN Books ON Loans.BookID = Books.BookId 
JOIN Users ON Loans.UserID = Users.UserID 
WHERE Loans.ReturnDate = '2023-03-20' AND Loans.LoanDate < DATEADD(DAY, -10, GETDATE());

--Report on Overdue Books:
-- Count the number of overdue books by genre
SELECT Books.GenreName , COUNT(*) as overdue_count
FROM Loans 
JOIN Books ON Loans.LoanID  = Books.BookId 
WHERE Loans.ReturnDate  ='2023-01-10' AND Loans.LoanDate  < DATEADD(DAY, -20, GETDATE())
GROUP BY Books.GenreName;

-- View transactions with return dates more than 30 days from the current date
SELECT *
FROM Loans 
WHERE DATEDIFF(DAY, GETDATE(), ReturnDate ) > 30;

-- View overdue loans with return dates more than 30 days from the current date
SELECT
    *,
    CASE
        WHEN DATEDIFF(DAY, GETDATE(), ReturnDate) > 30 THEN 'overdue'
        ELSE 'not overdue'
    END AS status
FROM
    Loans 
WHERE
    DATEDIFF(DAY, GETDATE(), ReturnDate) > 30;

-- Count the total number of overdue loans
SELECT
    COUNT(*) AS TotalOverdueLoans
FROM
    Loans 
WHERE
    DATEDIFF(DAY, GETDATE(), ReturnDate ) > 30;

--Report on Popular Book Genres:
-- List popular book genres by the number of loans
SELECT Books.GenreName , COUNT(*) as loan_count
FROM Loans 
JOIN Books ON Loans.BookID = Books.BookId 
GROUP BY Books.GenreName 
ORDER BY loan_count DESC;

-- Calculate the percentage of each genre among all loans
SELECT Books.GenreName , COUNT(*) * 100 / (SELECT COUNT(*) FROM Loans ) as percentage
FROM Loans 
JOIN Books ON Loans.BookID  = Books.BookId 
GROUP BY Books.GenreName 
ORDER BY percentage DESC;

-- Staffs Table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(255),
    StaffRole VARCHAR(50) -- 'Librarian' or 'Member'
);
--------------------------------------------------------------------------------------
--Phase 4: Access Control (DCL)
--Task 7: Define Staff Roles and Permissions
--Description: Define staff roles (e.g., librarian, member) and set appropriate permissions.

-- Librarians Table
-- Staff Table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(255)
);
CREATE TABLE Librarians (
    LibrarianID INT PRIMARY KEY,
    StaffID INT, -- Foreign key referencing Staff.StaffID
    LibrarianRole VARCHAR(50), -- Additional attributes specific to librarians
    UserName NVARCHAR(50) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(100) NOT NULL, -- Replace with the appropriate length for your hashed passwords
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);
 SELECT * FROM Librarians 

 -- Create the Members table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    StaffID INT, -- Foreign key referencing Staff.StaffID
    MemberRole VARCHAR(50), -- Additional attributes specific to members
    UserName NVARCHAR(50) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(100) NOT NULL, -- Replace with the appropriate length for your hashed passwords
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Alter the Staff Table to Include Role
ALTER TABLE Staff
ADD Role VARCHAR(50);

-- Insert Staff Names into Staff Table
INSERT INTO Staff (StaffID, StaffName)
VALUES
  (101, 'Alisson Thompson'),
  (102, 'Davis Johnson'),
  (103, 'Lucinda Smith'),
  (104, 'Michael Brown'),
  (105, 'Sandara Davis'),
  (201, 'Emilia Wilson'),
  (202, 'Brian Miller'),
  (203, 'Olive Davis'),
  (204, 'Matt Taylor'),
  (205, 'Sophie Martinez'),
  (206, 'Daniel Robinson'),
  (207, 'Chloe White'),
  (208, 'Bill Anderson');

SELECT * FROM Members  

-- Insert data into the Librarians table
INSERT INTO Librarians (LibrarianID, StaffID, LibrarianRole, UserName, PasswordHash)
VALUES
  (1, 101, 'Head Librarian', 'librarian1', 'hashedpassword1'),
  (2, 102, 'Cataloging Librarian', 'librarian2', 'hashedpassword2'),
  (3, 103, 'Reference Librarian', 'librarian3', 'hashedpassword3'),
  (4, 104, 'Acquisitions Librarian', 'librarian4', 'hashedpassword4'),
  (5, 105, 'Archives Librarian', 'librarian5', 'hashedpassword5');

-- Insert data into the Members table with username and password
INSERT INTO Members (MemberID, StaffID, MemberRole, UserName, PasswordHash)
VALUES
    (1001, 201, 'Student', 'student1', 'hashedpassword6'),
    (1002, 202, 'Faculty', 'faculty1', 'hashedpassword7'),
    (1003, 203, 'Researcher', 'researcher1', 'hashedpassword8'),
    (1004, 204, 'Visitor', 'visitor1', 'hashedpassword9'),
    (1005, 205, 'Alumnus', 'alumnus1', 'hashedpassword10'),
    (1006, 206, 'Student', 'student2', 'hashedpassword11'),
    (1007, 207, 'Faculty', 'faculty2', 'hashedpassword12'),
    (1008, 208, 'Researcher', 'researcher2', 'hashedpassword13');

-- Verify the table and data
SELECT * FROM Members;

-- Update Roles for Librarians
UPDATE Staff
SET Role = 'Librarian'
WHERE StaffID IN (101, 102, 103, 104, 105);

-- Update Roles for Members
UPDATE Staff
SET Role = 'Member'
WHERE StaffID IN (201, 202, 203, 204, 205, 206, 207, 208);

-- Update Roles for 5 Librarians with Different Roles
-- Update Roles for 8 Members with Different Roles
UPDATE Staff
SET Role = 
    CASE 
        WHEN StaffID = 101 THEN 'Head Librarian'
        WHEN StaffID = 102 THEN 'Cataloging Librarian'
        WHEN StaffID = 103 THEN 'Reference Librarian'
        WHEN StaffID = 104 THEN 'Acquisitions Librarian'
        WHEN StaffID = 105 THEN 'Archives Librarian'
        WHEN StaffID = 201 THEN 'Student'
        WHEN StaffID = 202 THEN 'Faculty'
        WHEN StaffID = 203 THEN 'Researcher'
        WHEN StaffID = 204 THEN 'Visitor'
        WHEN StaffID = 205 THEN 'Alumnus'
        WHEN StaffID = 206 THEN 'Student'
        WHEN StaffID = 207 THEN 'Faculty'
        WHEN StaffID = 208 THEN 'Researcher'
    END;

--Step 1: Create User Roles

-- Create roles for librarian and member
CREATE ROLE librarian;
CREATE ROLE member;

--Step 2: Assign Permissions to Roles
-- Grant SELECT permission on Books table to both librarian and member
GRANT SELECT ON dbo.Books TO librarian, member;

SELECT name FROM sys.database_principals WHERE type_desc = 'DATABASE_ROLE' AND name = 'librarian';

-- Verify the existence of the 'librarian' and 'member' roles
SELECT name 
FROM sys.database_principals 
WHERE type_desc = 'DATABASE_ROLE' 
  AND name IN ('librarian', 'member');

-- Grant INSERT, UPDATE, DELETE permissions on the Books table to the librarian role
GRANT INSERT, UPDATE, DELETE ON dbo.Books TO librarian;

-- Grant SELECT permission on Authors table to both librarian and member
GRANT SELECT ON dbo.Authors TO librarian, member;

-- Grant SELECT permission on Users table to librarian
GRANT SELECT ON dbo.Users TO librarian;

-- Grant SELECT permission on Loans table to librarian
GRANT SELECT ON dbo.Loans TO librarian;

-- Grant SELECT permission on genres table to both librarian and member
GRANT SELECT ON dbo.Genres TO librarian, member;

-- Grant INSERT, UPDATE, DELETE permissions on Genres table to librarian
GRANT INSERT, UPDATE, DELETE ON dbo.Genres TO librarian;

--Step 3: Assign Roles to Users
-- Add user to the librarian role
SELECT name FROM sys.database_principals WHERE name = 'librarian_user';

CREATE LOGIN librarian_user WITH PASSWORD = '12345';

CREATE USER librarian_user FOR LOGIN librarian_user;

ALTER ROLE librarian ADD MEMBER librarian_user;

-- Assuming 'member' is the role and 'member_user' is the user
SELECT name FROM sys.database_principals WHERE name = 'member_user';

CREATE LOGIN member_user WITH PASSWORD = '54321';

CREATE USER member_user FOR LOGIN member_user;

ALTER ROLE member ADD MEMBER member_user;
-----------------------------------------------------------------------------------------------------------
--Task 9: Simulate User Interactions
--Description: Simulate user interactions with the system, demonstrating how access control works based on user roles.

SELECT name AS DatabaseName
FROM sys.databases;

USE [Eric R.  Aunzo LMS Final Project MS SQL Masterclass];

CREATE PROCEDURE dbo.LibraryLogin
    @pUsername NVARCHAR(50),
    @pPassword NVARCHAR(50)
AS
BEGIN
    DECLARE @UserID INT;
    DECLARE @UserRole NVARCHAR(20);

    -- Check if the username and password match
    SELECT @UserID = [LibrarianID], @UserRole = [LibrarianRole]
    FROM [dbo].[Librarians]  -- Replace YourUsersTable with the actual name of your users table
    WHERE Username = @pUsername AND [PasswordHash]= @pPassword;

    -- Check the login result
    IF @UserID IS NOT NULL
    BEGIN
        SELECT 'Login successful' AS Result, @UserRole AS UserRole, @UserID AS UserID;
    END
    ELSE
    BEGIN
        SELECT 'Invalid credentials' AS Result;
    END
END;


-- Simulate librarian login ('librarian1', 'hashedpassword1')
EXEC dbo.LibraryLogin @pUsername = 'librarian1', @pPassword = 'hashedpassword1';

-- Librarian views a list of books
SELECT * FROM Books;

-- Librarian updates book information (From 'The Hobbit a Journey back to original title)
UPDATE Books
SET [BookTitle]= 'The Hobbit'
WHERE BookID = 3001;

--Adding a New Book:
-- Simulating a librarian adding a new book
INSERT INTO Books (BookTitle, AuthorId, ISBN, PublishedDate, GenreName, GenreID) VALUES
('The Hobbit Part 2', 1016, '979-0-395-07430-4', '1938-10-20','Fantasy', 15 );

--. Deleting a Book:
-- Librarian can delete a book
DELETE FROM Books WHERE BookId = 3898;
----------------------------------------------------------------------------
CREATE PROCEDURE dbo.MemberLogin
    @pUsername NVARCHAR(50),
    @pPassword NVARCHAR(50)
AS
BEGIN
    DECLARE @UserID INT;
    DECLARE @UserRole NVARCHAR(20);

    -- Check if the username and password match
    SELECT @UserID = [MemberID], @UserRole = [MemberRole]
    FROM  [dbo].[Members] 
    WHERE Username = @pUsername AND [PasswordHash]= @pPassword;

    -- Check the login result
    IF @UserID IS NOT NULL
    BEGIN
        SELECT 'Login successful' AS Result, @UserRole AS UserRole, @UserID AS UserID;
    END
    ELSE
    BEGIN
        SELECT 'Invalid credentials' AS Result;
    END
END;
-----------------------------------------------------------------------------------
-- Assuming you have a Members table with MemberID, MemberRole, and other relevant columns
DECLARE @UserID INT;
DECLARE @UserRole NVARCHAR(50);

-- Set the member's ID and role (replace with actual values)
SET @UserID = 1001; -- Replace with the actual MemberID
SET @UserRole = 'Student'; -- Replace with the actual member role name

-- Check if the user is a member with the specified role
IF EXISTS (
    SELECT 1
    FROM Members
    WHERE MemberID = @UserID 
        AND MemberRole = @UserRole 
)
BEGIN
    -- Attempt to update the Books table (should fail due to lack of permission)
    BEGIN TRY
        -- Member attempts to update the Books table
        UPDATE dbo.Books
        SET [BookTitle] = 'The Hobbit'
        WHERE BookID = 3001;

        -- If the update succeeds, print a success message
        PRINT 'Update successful';
    END TRY
    BEGIN CATCH
        -- If an error occurs, catch it and print an error message
        PRINT 'Error: Member does not have permission to update the Books table';
    END CATCH
END
ELSE
BEGIN
    -- If the user is not a member with the specified role, print an error message
    PRINT 'Error: User is not a member with the specified role';
END
----------------------------------------------------------------------------------
-- Deny UPDATE permission to all users for the Books table
DENY UPDATE ON dbo.Books TO PUBLIC;

-- Attempt to update the Books table
BEGIN TRY
    -- Random user attempts to update the Books table
    UPDATE dbo.Books
    SET [BookTitle] = 'The Hobbit'
    WHERE BookID = 3001;

    -- If the update succeeds, print a success message
    PRINT 'Update successful';
END TRY
BEGIN CATCH
    -- If an error occurs, catch it and print an error message
    PRINT 'Error: User does not have permission to update the Books table';
END CATCH;

CREATE ROLE MemberRole;

-- Revoke UPDATE permission from MemberRole
REVOKE UPDATE ON dbo.Books TO MemberRole;

-- Deny UPDATE permission to MemberRole for the Books table
DENY UPDATE ON dbo.Books TO MemberRole;

-- Simulate member login ('student1', 'hashedpassword6'),
EXEC dbo.MemberLogin  @pUserName = 'student1', @pPassword = 'hashedpassword6';

-- Member searches for books
SELECT * FROM Books WHERE GenreName = 'Mystery';

-- Member searches for books in the 'Mystery' genre
SELECT *, COUNT(*) OVER () AS BookCount
FROM Books
WHERE GenreName = 'Mystery';

-- Simulating a member loaning a book
SELECT * FROM Loans 

INSERT INTO Loans (BookID, UserID, LoanDate, ReturnDate)
VALUES (3002, 102, '2023-02-12', '2023-02-15');


CREATE PROCEDURE Logout
AS
BEGIN
    -- Procedure logic here
    PRINT 'Logout procedure executed successfully';
END;

SELECT name
FROM sys.procedures
WHERE name = 'Logout';

-- Librarian logs out
EXEC Logout;

-- Member logs out
EXEC Logout;

--END
--------------------------------------------------------------------------------------------
































