select musical_genres.name, count(perfomans.psevdonim) from musical_genres
join artists_genres on  musical_genres.id = genres_id
join perfomans on artists_id = perfomans.id
group by musical_genres.name;

select count(track.name) from track
join albums on album_id = albums.id
where albums.year between 2019 and 2020;

select avg(duration), albums.name from track 
join albums on album_belongs = albums.id
group by albums.name;

select psevdonim from perfomans where psevdonim not in
(select psevdonim from perfomans 
join artists_albums on perfomans.id = artists_id
join albums on album_id = albums.id
where album.year = 2020);

select distinic from compilation as D
join track_list as TL on D.ID = TL.compilation_id
join track as T on track_id = T.id
join artists_albums as AA on T.album_id = AA.album_id
join perfomans as P on AA.perfomans_id = P.id
where name = 'Виктор Цой';

select name from albums
join artists_albums on albums.id = album_id
join perfomans on artist_id = perfomans.id
join artists_genres on perfomans.id = genres_id
group by albums.name
having (count(artists_genres.musical_genres.id) > 1);

select T.name from track T 
left join compilation D on T.id = D.id 
where D.id is null;

select psevdonim from perfomans 
join artists_albums on perfomans.id = artist_id 
join albums on album_id = albums.id
join track on albums.id = track.album_belongs 
where duration =
(select min(duration) from track);

select albums.name from albums
join track on albums.id = track.album_belongs  
group by albums.name
having count(track.id) = 
(select count(track) from albums 
join track on albums.id = track.album_belongs 
group by albums.name
order by count(track)
limit 1);