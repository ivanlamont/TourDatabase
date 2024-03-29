

create proc list_tour_places @tourID uniqueidentifier as

SELECT p.Center.Lat, p.Center.Long, p.Name, p.Size
  FROM Tour_DEV2.Triggers t
  inner join Places p on t.PlaceID = p.ID
  inner join TourLayers tl on t.TourLayerID = tl.ID
  inner join Tours m on tl.TourID = m.ID
  where m.id = @tourID

GO
