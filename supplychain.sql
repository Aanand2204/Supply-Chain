use supplychain
--✅ 1. Inventory Management
--Goal: Show current inventory levels and trends.
-- Current inventory levels by product and warehouse
SELECT 
    ProductID,
    WarehouseID,
    SUM(InventoryLevel) AS CurrentInventory
FROM [supply_chain_data (5)]
GROUP BY ProductID, WarehouseID;

-- Inventory trends over time
SELECT 
    Date,
    ProductID,
    SUM(InventoryLevel) AS InventoryTrend
FROM [supply_chain_data (5)]
GROUP BY Date, ProductID
ORDER BY Date;

--✅ 2. Order Fulfillment
--Goal: Track fulfillment and on-time delivery.

-- Order fulfillment status over time
SELECT 
    Date,
    FulfillmentStatus,
    COUNT(OrderID) AS OrdersCount
FROM [supply_chain_data (5)]
GROUP BY Date, FulfillmentStatus;

-- On-time delivery rate by product
SELECT 
    ProductID,
    SUM(CAST(OnTimeDelivery AS INT)) * 100.0 / COUNT(OrderID) AS OnTimeDeliveryRate
FROM [supply_chain_data (5)]
GROUP BY ProductID;

--✅ 3. Supplier Performance
--Goal: Assess delivery speed and defect rates.
-- Average delivery time by supplier
SELECT 
    SupplierID,
    AVG(DeliveryTime) AS AvgDeliveryTime
FROM [supply_chain_data (5)]
GROUP BY SupplierID;
-- Defect rate over time
SELECT 
    Date,
    SUM(DefectiveUnits) * 1.0 / SUM(Number_of_products_sold) AS DefectRate
FROM [supply_chain_data (5)]
GROUP BY Date;

--✅ 4. Transportation Efficiency
--Goal: Evaluate transit time and carrier reliability.

-- Transit time by carrier and delivery status
SELECT 
    Carrier,
    DeliveryStatus,
    AVG(Lead_times) AS AvgTransitTime
FROM [supply_chain_data (5)]
GROUP BY Carrier, DeliveryStatus;

-- Delivery status over time
SELECT 
    Date,
    DeliveryStatus,
    COUNT(*) AS Count
FROM [supply_chain_data (5)]
GROUP BY Date, DeliveryStatus;

--✅ 5. Supply Chain Costs
--Goal: Track total and category-specific costs.
-- Cost distribution by type
SELECT 
    CostType,
    SUM(Amount) AS TotalAmount
FROM [supply_chain_data (5)]
GROUP BY CostType;

-- Cost trends over time
SELECT 
    Date,
    SUM(Amount) AS DailyTotalCost
FROM [supply_chain_data (5)]
GROUP BY Date
ORDER BY Date;

