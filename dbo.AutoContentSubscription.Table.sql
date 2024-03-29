
CREATE TABLE AutoContentSubscription(
	SubscriptionID uniqueidentifier NOT NULL,
	OwnerID uniqueidentifier NOT NULL,
	TourID uniqueidentifier NOT NULL,
	IsActive bit NOT NULL,
	Balance decimal(18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	SubscriptionID ASC
)
)
GO
ALTER TABLE AutoContentSubscription ADD  DEFAULT (newid()) FOR SubscriptionID
GO
ALTER TABLE AutoContentSubscription ADD  DEFAULT ((0)) FOR IsActive
GO
ALTER TABLE AutoContentSubscription ADD  DEFAULT ((0)) FOR Balance
GO
