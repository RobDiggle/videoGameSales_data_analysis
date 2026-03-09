CREATE TABLE FactSales (
    SaleKey INT PRIMARY KEY,
    InvoiceNumber VARCHAR(50),
    SaleDate DATE,
    GameKey INT,
    CustomerKey INT,
    RetailerKey INT,
    UnitsSold INT,
    UnitPrice DECIMAL(10,2),
    DiscountPct DECIMAL(5,2),
    UnitCost DECIMAL(10,2),
    NetSalesAmount DECIMAL(12,2),
    TotalCostAmount DECIMAL(12,2),
    GrossProfitAmount DECIMAL(12,2),
    GrossMarginPct DECIMAL(5,2),
    PromoFlag BOOLEAN,
    OrderSource VARCHAR(50)
);

CREATE TABLE DimGame (
    GameKey INT PRIMARY KEY,
    GameCode VARCHAR(20),
    GameTitle VARCHAR(255),
    Franchise VARCHAR(255),
    Genre VARCHAR(100),
    Platform VARCHAR(50),
    DeveloperStudio VARCHAR(255),
    PublisherDivision VARCHAR(255),
    ReleaseDate DATE,
    ESRBRating VARCHAR(10),
    ListPrice DECIMAL(10,2),
    UnitCost DECIMAL(10,2)
);

CREATE TABLE DimCustomer (
    CustomerKey INT PRIMARY KEY,
    CustomerCode VARCHAR(20),
    CustomerName VARCHAR(255),
    Email VARCHAR(255),
    Country VARCHAR(100),
    Region VARCHAR(100),
    Segment VARCHAR(100),
    LoyaltyTier VARCHAR(50),
    SignupDate DATE,
    AgeBand VARCHAR(50)
);

CREATE TABLE DimRetailer (
    RetailerKey INT PRIMARY KEY,
    RetailerCode VARCHAR(20),
    RetailerName VARCHAR(255),
    ChannelType VARCHAR(100),
    Country VARCHAR(100),
    Region VARCHAR(100),
    ContractTier VARCHAR(50),
    LaunchDate DATE,
    AccountManager VARCHAR(255)
);

--Checking to see if data importing worked

SELECT * FROM factsales
LIMIT 10;

SELECT * FROM DimCustomer
LIMIT 10;

SELECT * FROM DimGame
LIMIT 10;

SELECT * FROM DimRetailer
LIMIT 10


