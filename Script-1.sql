CREATE TABLE IF NOT EXISTS genres(
	id SERIAL primary key,
	genres_name VARCHAR(40) not null
);
CREATE TABLE IF NOT EXISTS artists(
	id SERIAL primary key,
	nickname VARCHAR(40) not null
);
CREATE TABLE IF NOT EXISTS artistsgenres(
	id SERIAL primary key,
	artists_id INTEGER not null references artists(id),
	genres_id INTEGER not null references genres(id)
);
CREATE TABLE IF NOT EXISTS albums(
	id SERIAL primary key,
	albums_name VARCHAR(40) not null,
	release_date DATE not null
);
CREATE TABLE IF NOT EXISTS artistsalbums(
	id SERIAL primary key,
	artists_id INTEGER not null references artists(id),
	albums_id INTEGER not null references albums(id)
);
CREATE TABLE IF NOT EXISTS tracks(
	id SERIAL primary key,
	tracks_name VARCHAR(40) not null,
	duration INTEGER not null,
	albums_id INTEGER not null references albums(id)
);
CREATE TABLE IF NOT EXISTS collections(
	id SERIAL primary key,
	collections_name VARCHAR(40) not null,
	release_date DATE not null
);
CREATE TABLE IF NOT EXISTS trackscollections(
	id SERIAL primary key,
	tracks_id INTEGER not null references tracks(id),
	collections_id INTEGER not null references collections(id)
);
