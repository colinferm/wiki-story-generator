DROP TABLE IF EXISTS urswiki_story_generator;
CREATE TABLE IF NOT EXISTS urswiki_story_generator (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	story_key VARCHAR(100) NOT NULL,
	story_value VARCHAR(255) NOT NULL,
	appender VARCHAR(5) NOT NULL DEFAULT 'when',
	year_before VARCHAR(4),
	year_after VARCHAR(4),
	persons INT NOT NULL DEFAULT 1,
	gender VARCHAR(10),
	wiki_key VARCHAR(255),
	city VARCHAR(50),
	needs_ship ENUM('T','F') NOT NULL DEFAULT 'F',
	needs_planet ENUM('T', 'F') NOT NULL DEFAULT 'F'
);

INSERT INTO urswiki_story_generator (story_key, story_value) VALUES('planet', 'Earth');

/*
 * Story parts
 */
INSERT INTO urswiki_story_generator (story_key, story_value, persons, gender) VALUES('mainplot', 'fall in love on', 2, 'manman');
INSERT INTO urswiki_story_generator (story_key, story_value, persons, gender) VALUES('mainplot', 'fall in love on', 2, 'womanwoman');
INSERT INTO urswiki_story_generator (story_key, story_value, persons, gender) VALUES('mainplot', 'fall in love on', 2, 'manwoman');
INSERT INTO urswiki_story_generator (story_key, story_value, persons, gender) VALUES('mainplot', 'fall in love on', 2, 'boyboy');
INSERT INTO urswiki_story_generator (story_key, story_value, persons, gender) VALUES('mainplot', 'fall in love on', 2, 'girlgirl');
INSERT INTO urswiki_story_generator (story_key, story_value, persons, gender) VALUES('mainplot', 'fall in love on', 2, 'boygirl');
INSERT INTO urswiki_story_generator (story_key, story_value, appender, year_before, persons) VALUES('mainplot', 'escape to the world', 'but', '2169', 2);
INSERT INTO urswiki_story_generator (story_key, story_value, appender, year_before, needs_planet, needs_ship) VALUES('mainplot', 'escapes to the world','but', '2169', 'T', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, persons) VALUES('mainplot', 'are traveling to the planet', 2);
INSERT INTO urswiki_story_generator (story_key, story_value, needs_ship, needs_planet) VALUES('mainplot', 'is traveling to the planet', 'T', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value) VALUES('mainplot', 'struggles to make a living on');
INSERT INTO urswiki_story_generator (story_key, story_value, wiki_key) VALUES('mainplot', 'lives in a whorehouse on', 'Prostitution');
INSERT INTO urswiki_story_generator (story_key, story_value, appender, wiki_key, gender) VALUES('mainplot', 'wants to join the Republican Fleet on', 'but', 'Republican_Fleet', 'boy');
INSERT INTO urswiki_story_generator (story_key, story_value, appender, wiki_key, gender) VALUES('mainplot', 'wants to join the Republican Fleet on', 'but', 'Republican_Fleet', 'girl');
INSERT INTO urswiki_story_generator (story_key, story_value, wiki_key, gender, needs_planet) VALUES('mainplot', 'is a member of the Republican Fleet on', 'Republican_Fleet', 'man', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, wiki_key, gender, needs_planet) VALUES('mainplot', 'is a member of the Republican Fleet on', 'Republican_Fleet', 'woman', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, appender) VALUES('mainplot', 'wants to impress his father on', 'man', 'but');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, appender) VALUES('mainplot', 'wants to impress his father on', 'boy', 'but');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, appender) VALUES('mainplot', 'wants to impress her father on', 'woman', 'but');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, appender) VALUES('mainplot', 'wants to impress her father on', 'girl', 'but');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, appender, needs_planet) VALUES('mainplot', 'wants to kill his father on', 'man', 'but', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, appender, needs_planet) VALUES('mainplot', 'wants to kill his father on', 'boy', 'but', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, appender, needs_planet) VALUES('mainplot', 'wants to kill her father on', 'woman', 'but', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, appender, needs_planet) VALUES('mainplot', 'wants to kill her father on', 'girl', 'but', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against his father\'s killers on', 'man', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against his father\'s killers on', 'boy', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against her father\'s killers on', 'woman', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against her father\'s killers on', 'girl', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against his mother\'s killers on', 'man', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against his mother\'s killers on', 'boy', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against her mother\'s killers on', 'woman', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against her mother\'s killers on', 'girl', 'T');

INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against his brother\'s killers on', 'man', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against his brother\'s killers on', 'boy', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against his sister\'s killers on', 'man', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against his sister\'s killers on', 'boy', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against his twin brother\'s killers on', 'man', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against his twin brother\'s killers on', 'boy', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against his twin sister\'s killers on', 'man', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against his twin sister\'s killers on', 'boy', 'T');

INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against her brother\'s killers on', 'woman', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against her brother\'s killers on', 'girl', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against her sister\'s killers on', 'woman', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against her sister\'s killers on', 'girl', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against her twin brother\'s killers on', 'woman', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against her twin brother\'s killers on', 'girl', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against her twin sister\'s killers on', 'woman', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against her twin sister\'s killers on', 'girl', 'T');

INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against her girlfriend\'s killers on', 'woman', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against her wife\'s killers on', 'woman', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against her husband\'s killers on', 'woman', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against his girlfriend\'s killers on', 'man', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against his wife\'s killers on', 'man', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'wants revenge against his husband\'s killers on', 'man', 'T');

INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('mainplot', 'is a falling down drunk on', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('mainplot', 'is a falling down drunk on', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, wiki_key, needs_ship, gender) VALUES('mainplot', 'is a cargo ship skipper going to', 'Shipper', 'T', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, wiki_key, needs_ship, gender) VALUES('mainplot', 'is a cargo ship skipper going to', 'Shipper', 'T', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, wiki_key, needs_ship, gender) VALUES('mainplot', 'is a cargo ship first mate going to', 'Shipper', 'T', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, wiki_key, needs_ship, gender) VALUES('mainplot', 'is a cargo ship first mate going to', 'Shipper', 'T', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, wiki_key, gender, needs_ship) VALUES('mainplot', 'is a cargo ship\'s "kid" going to', 'Shipper', 'boy', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, wiki_key, gender, needs_ship) VALUES('mainplot', 'is a cargo ship\'s "kid" going to', 'Shipper', 'girl', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'has tracked his best friend to', 'man', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'has tracked her best friend to', 'woman', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'has tracked his ex-lover to', 'man', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'has tracked her ex-lover to', 'woman', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, wiki_key, needs_ship, gender) VALUES('mainplot', 'has found the stolen cargo he was sent to find on', 'Recovery_Specialists', 'T', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, wiki_key, needs_ship, gender) VALUES('mainplot', 'has found the stolen cargo she was sent to find on', 'Recovery_Specialists', 'T', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, needs_ship) VALUES('mainplot', 'is on a stolen cargo ship headed to', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, needs_planet) VALUES('mainplot', 'has finally saved up enough money to move to', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('mainplot', 'has just gotten out of jail on', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('mainplot', 'has just gotten out of jail on', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'is going away to college on', 'boy', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, needs_planet) VALUES('mainplot', 'is going away to college on', 'girl', 'T');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('mainplot', 'is a sex addict with relationship issues on', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('mainplot', 'is a sex addict with relationship issues on', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, wiki_key) VALUES('mainplot', 'thinks joining the militia will be fun on', 'Planetary_Militia');

INSERT INTO urswiki_story_generator (story_key, story_value, gender, appender) VALUES('mainplot', 'falls in love with her perfect man on', 'woman', 'but');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, appender) VALUES('mainplot', 'falls in love with her perfect woman on', 'woman', 'but');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, appender) VALUES('mainplot', 'falls in love with his perfect man on', 'man', 'but');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, appender) VALUES('mainplot', 'falls in love with his perfect woman on', 'man', 'but');

INSERT INTO urswiki_story_generator (story_key, story_value, gender, appender) VALUES('mainplot', 'falls in love with boy of his dreams on', 'boy', 'but');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, appender) VALUES('mainplot', 'falls in love with girl of his dreams on', 'boy', 'but');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, appender) VALUES('mainplot', 'falls in love with boy of her dreams on', 'girl', 'but');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, appender) VALUES('mainplot', 'falls in love with girl of her dreams on', 'girl', 'but');

INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'is a gunsmith with Galileo Arms', 'New Chicago', 'Galileo_Arms|Galileo', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'is a gunsmith with Galileo Arms', 'New Chicago', 'Galileo_Arms|Galileo', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, wiki_key, gender) VALUES ('mainplot', 'is a gunsmith with Calcutta Arms', 'Calcutta_Arms', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, wiki_key, gender) VALUES ('mainplot', 'is a gunsmith with Calcutta Arms', 'Calcutta_Arms', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at the Athena Commodities Exchange', 'Athena City', 'Athena_Commodities_Exchange|Athena', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at the Athena Commodities Exchange', 'Athena City', 'Athena_Commodities_Exchange|Athena', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at the Athena Stock Exchange', 'Athena City', 'Athena_Stock_Exchange|Athena', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at the Athena Stock Exchange', 'Athena City', 'Athena_Stock_Exchange|Athena', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at the Central Bank of the Republic', 'Athena City', 'Central_Bank_of_the_Republic|Athena', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at the Central Bank of the Republic', 'Athena City', 'Central_Bank_of_the_Republic|Athena', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at Galileo Farm', 'College Park', 'Galileo_Farm|Galileo', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at Galileo Farm', 'College Park', 'Galileo_Farm|Galileo', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at Kaesong Motors', 'Athena City', 'Kaesong_Motors|Athena', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at Kaesong Motors', 'Athena City', 'Kaesong_Motors|Athena', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at Nakimora', 'Nakimora', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at Nakimora', 'Nakimora', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at Rayo', 'College Park', 'Rayo|Galileo', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at Rayo', 'College Park', 'Rayo|Galileo', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at Rayo Motors', 'New Chicago', 'Rayo_Motors|Galileo', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at Rayo Motors', 'New Chicago', 'Rayo_Motors|Galileo', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at the Republican Bond Corporation', 'Cobanito', 'Republican_Bond_Corporation|Shaanxi', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at the Republican Bond Corporation', 'Cobanito', 'Republican_Bond_Corporation|Shaanxi', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at the Santos Recreational Pharmaceuticals', 'Cobanito', 'Santos_Recreational_Pharmaceuticals|Shaanxi', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at the Santos Recreational Pharmaceuticals', 'Cobanito', 'Santos_Recreational_Pharmaceuticals|Shaanxi', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at Space Vehicles of The Republic', 'Katsuyama', 'Space_Vehicles_of_The_Republic|Yamanashi_Skyplex|Yamanashi', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at Space Vehicles of The Republic', 'Katsuyama', 'Space_Vehicles_of_The_Republic|Yamanashi_Skyplex|Yamanashi', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at Two Girls Tobacco', 'Matthew', 'Two_Girls_Tobacco|Columbus', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, city, wiki_key, gender) VALUES ('mainplot', 'finally has the perfect job at Two Girls Tobacco', 'Matthew', 'Two_Girls_Tobacco|Columbus', 'woman');


/*
 * Conflicts
 */
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'pirates raid his hometown and he must defend it.', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'pirates raid his hometown and he must defend it.', 'boy');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'pirates raid her hometown and she must defend it.', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'pirates raid her hometown and she must defend it.', 'girl');
INSERT INTO urswiki_story_generator (story_key, story_value, wiki_key) VALUES('conflict', 'the UUHA invades.', 'Universal_United_Human_Authority|First_Republican_Defensive|Second_Republican_Defensive|Invasion_of_2338|Battle_for_the_Republic');
INSERT INTO urswiki_story_generator (story_key, story_value) VALUES('conflict', 'a deadly contagion breaks out that must be stopped before everyone dies.');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'a band of raiders try to throw his family off their farm.', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'a band of raiders try to throw his family off their farm.', 'boy');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'a band of raiders try to throw her family off their farm.', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'a band of raiders try to throw her family off their farm.', 'girl');
INSERT INTO urswiki_story_generator (story_key, story_value) VALUES('conflict', 'a little girl says she needs someone with a gun to solve her problems.');
INSERT INTO urswiki_story_generator (story_key, story_value) VALUES('conflict', 'a little boy says he needs someone with a gun to solve his problems.');
/*
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'her only niece gets into trouble because she saw something she shouldn\'t have.', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'her only niece gets into trouble because she saw something she shouldn\'t have.', 'girl');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'her only nephew gets into trouble because he saw something he shouldn\'t have.', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'her only nephew gets into trouble because he saw something he shouldn\'t have.', 'girl');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'his only niece gets into trouble because she saw something she shouldn\'t have.', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'his only niece gets into trouble because she saw something she shouldn\'t have.', 'boy');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'his only nephew gets into trouble because he saw something he shouldn\'t have.', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'his only nephew gets into trouble because he saw something he shouldn\'t have.', 'boy');
*/
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'his best friend gets into trouble because he saw something he shouldn\'t have.', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'his best friend gets into trouble because she saw something he shouldn\'t have.', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'his best friend gets into trouble because he saw something he shouldn\'t have.', 'boy');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'his best friend gets into trouble because she saw something he shouldn\'t have.', 'boy');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'her best friend gets into trouble because he saw something he shouldn\'t have.', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'her best friend gets into trouble because she saw something he shouldn\'t have.', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'her best friend gets into trouble because he saw something he shouldn\'t have.', 'girl');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'her best friend gets into trouble because she saw something he shouldn\'t have.', 'girl');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, wiki_key) VALUES('conflict', 'his best friend is captured by the UUHA.', 'man', 'Universal_United_Human_Authority');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, wiki_key) VALUES('conflict', 'his best friend is captured by the UUHA.', 'boy', 'Universal_United_Human_Authority');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, wiki_key) VALUES('conflict', 'her best friend is captured by the UUHA.', 'woman', 'Universal_United_Human_Authority');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, wiki_key) VALUES('conflict', 'her best friend is captured by the UUHA.', 'girl', 'Universal_United_Human_Authority');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, wiki_key) VALUES('conflict', 'his secret identity as a UUHA agent risks being exposed.', 'man', 'Universal_United_Human_Authority');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, wiki_key) VALUES('conflict', 'her secret identity as a UUHA agent risks being exposed.', 'woman', 'Universal_United_Human_Authority');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'her past life in a crime syndicate finally catches up with her.', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'his past life in a crime syndicate finally catches up with him.', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'she is arrested for a murder she didn\'t commit.', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'she is arrested for a murder she didn\'t commit.', 'girl');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'he is arrested for a murder he didn\'t commit.', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'he is arrested for a murder he didn\'t commit.', 'boy');

INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'all he really wants is to find true love.', 'boy');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'all he really wants is to find true love.', 'man');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'all she really wants is to find true love.', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'all she really wants is to find true love.', 'girl');

INSERT INTO urswiki_story_generator (story_key, story_value, gender, wiki_key) VALUES('conflict', 'the Galileo City Republicans make it to the Republican series and she has tickets.', 'woman', 'Galileo_City_Republicans|Republican_Baseball|Galileo_City');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, wiki_key) VALUES('conflict', 'the Galileo City Republicans make it to the Republican series and he has tickets.', 'man', 'Galileo_City_Republicans|Republican_Baseball|Galileo_City');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, wiki_key) VALUES('conflict', 'the Athena City Sand Dollars make it to the Republican series and she has tickets.', 'woman', 'Athena_City_Sand_Dollars|Republican_Baseball|Athena_City|Republican_Series');
INSERT INTO urswiki_story_generator (story_key, story_value, gender, wiki_key) VALUES('conflict', 'the Athena City Sand Dollars make it to the Republican series and he has tickets.', 'man', 'Athena_City_Sand_Dollars|Republican_Baseball|Athena_City|Republican_Series');

INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'she is kidnapped in exchange for information she doesn\'t have.', 'girl');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'she is kidnapped in exchange for information she doesn\'t have.', 'woman');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'he is kidnapped in exchange for information he doesn\'t have.', 'boy');
INSERT INTO urswiki_story_generator (story_key, story_value, gender) VALUES('conflict', 'he is kidnapped in exchange for information he doesn\'t have.', 'man');
