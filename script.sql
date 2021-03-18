create table if not exists color
(
	color_id serial not null
		constraint color_pk
			primary key,
	color_name varchar(50)
);

alter table color owner to postgres;

create table if not exists climate
(
	climat_id serial not null
		constraint climate_pk
			primary key,
	climat_name varchar
);

alter table climate owner to postgres;

create table if not exists terrain
(
	terrain_id serial not null
		constraint terrain_pk
			primary key,
	terrain_name varchar not null
);

alter table terrain owner to postgres;

create table if not exists planete
(
	planete_id serial not null
		constraint planete_pk
			primary key,
	planete_name varchar,
	rotation_period integer,
	orbital_period integer,
	diameter integer,
	climat_idx integer
		constraint planete_climate_climat_id_fk
			references climate,
	gravite double precision,
	terrain_idx integer
		constraint planete_terrain_terrain_id_fk
			references terrain,
	surface_water bigint,
	population bigint
);

alter table planete owner to postgres;

create table if not exists species
(
	species_id serial not null
		constraint species_pk
			primary key,
	species_name varchar,
	classification varchar,
	designation varchar,
	average_height integer,
	average_lifespam integer,
	langage varchar,
	planet_idx integer
		constraint planete_idx_fk
			references planete
);

alter table species owner to postgres;

create table if not exists characters
(
	characters_id serial not null
		constraint characters_pk
			primary key,
	characters_name varchar,
	height integer,
	mass integer,
	birth_year varchar,
	gender varchar,
	species_idx integer
		constraint species_idx_fk
			references species,
	planet_idx integer
);

alter table characters owner to postgres;

create table if not exists color_eye
(
	color_idx integer not null
		constraint color_id___fk
			references color,
	characters_idx integer not null
		constraint color_eye_characters_characters_id_fk
			references characters,
	constraint color_eye_pk
		primary key (color_idx, characters_idx)
);

alter table color_eye owner to postgres;

create table if not exists color_hair
(
	color_idx integer
		constraint color_idx___fk
			references color,
	characters_idx integer
		constraint characters_idx_fk
			references characters,
	constraint color_hair_pk
		unique (color_idx, characters_idx)
);

alter table color_hair owner to postgres;

create unique index if not exists terrain_terrain_name_uindex
	on terrain (terrain_name);

create table if not exists motors
(
	motor_id serial not null
		constraint motors_pk
			primary key,
	motor_name varchar,
	model varchar,
	manifacturer varchar,
	"cost_in_credits  " integer,
	length_ integer,
	max_atmospher integer,
	crew integer,
	passengers integer,
	cargo_capacity integer,
	consumable varchar
);

alter table motors owner to postgres;

create table if not exists vehicule
(
	vehicule_id serial not null
		constraint vehicule_pk
			primary key,
	vehicule_class varchar,
	motors_idx integer
		constraint motors_idx_fk
			references motors
);

alter table vehicule owner to postgres;

create table if not exists vaisseau
(
	vaisseau_id serial not null
		constraint vaisseau_pk
			primary key,
	hyperdrive_rating integer,
	mglt integer,
	starship_class varchar,
	motors_idx integer
		constraint motor_idex_fk
			references motors,
	species_idx integer
		constraint species_idex_fk
			references species
);

alter table vaisseau owner to postgres;

create table if not exists "color_Skin"
(
	color_idx integer not null
		constraint color_skin_color_color_id_fk
			references color,
	characters_idx integer not null
		constraint characters_idx_fk
			references characters,
	constraint color_skin_pk
		primary key (color_idx, characters_idx)
);

alter table "color_Skin" owner to postgres;
