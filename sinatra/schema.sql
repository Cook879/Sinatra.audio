--
-- Table structure for table `sinatra_album`
--

DROP TABLE IF EXISTS `sinatra_album`;
CREATE TABLE `sinatra_album` (
  `album_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The id of the project',
  `title` text NOT NULL COMMENT 'The title of the project',
  `label` text NOT NULL COMMENT 'The record label of the project',
  `date` text NOT NULL COMMENT 'The date of the project',
  `notes` longtext COMMENT 'Notes',
  `wikipedia` text,
  `youtube` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='Stores projects';

--
-- Table structure for table `sinatra_artist_display`
--

DROP TABLE IF EXISTS `sinatra_artist_display`;
CREATE TABLE `sinatra_artist_display` (
  `display_id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` text NOT NULL,
  PRIMARY KEY (`display_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

--
-- Table structure for table `sinatra_concert`
--

DROP TABLE IF EXISTS `sinatra_concert`;
CREATE TABLE `sinatra_concert` (
  `concert_id` int(11) NOT NULL AUTO_INCREMENT,
  `location` text NOT NULL,
  `date` datetime NOT NULL,
  `date_display` text NOT NULL,
  `notes` text,
  `source` text,
  PRIMARY KEY (`concert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Table structure for table `sinatra_film`
--

DROP TABLE IF EXISTS `sinatra_film`;
CREATE TABLE `sinatra_film` (
  `film_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `studio` text NOT NULL,
  `date` datetime NOT NULL,
  `date_display` text NOT NULL,
  `notes` text,
  `script` text,
  PRIMARY KEY (`film_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Table structure for table `sinatra_film_person`
--

DROP TABLE IF EXISTS `sinatra_film_person`;
CREATE TABLE `sinatra_film_person` (
  `film_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`film_id`,`person_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `sinatra_person`
--

DROP TABLE IF EXISTS `sinatra_person`;
CREATE TABLE `sinatra_person` (
  `person_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The id of the person',
  `first_name` text NOT NULL COMMENT 'The first name of the person',
  `surname` text NOT NULL COMMENT 'The surname of the person',
  `wikipedia` text NOT NULL,
  `notes` longtext COMMENT 'Notes',
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1957 DEFAULT CHARSET=utf8 COMMENT='Stores people';

--
-- Table structure for table `sinatra_radio`
--

DROP TABLE IF EXISTS `sinatra_radio`;
CREATE TABLE `sinatra_radio` (
  `radio_id` int(11) NOT NULL AUTO_INCREMENT,
  `series` text NOT NULL,
  `episode` text,
  `network` text NOT NULL,
  `date` datetime NOT NULL,
  `date_display` text NOT NULL,
  `notes` longtext,
  `script` longtext,
  `length` text,
  `sponser` text,
  `youtube` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`radio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Table structure for table `sinatra_radio_person`
--

DROP TABLE IF EXISTS `sinatra_radio_person`;
CREATE TABLE `sinatra_radio_person` (
  `radio_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`radio_id`,`person_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `sinatra_recording`
--

DROP TABLE IF EXISTS `sinatra_recording`;
CREATE TABLE `sinatra_recording` (
  `recording_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The id of the recording',
  `artist_display` int(11) NOT NULL COMMENT 'The display title for the artists',
  `type` text NOT NULL COMMENT 'The type of recording',
  `length` text COMMENT 'The length of the recording',
  `lyrics` longtext,
  `notes` longtext COMMENT 'Notes',
  `project_type` varchar(25) NOT NULL DEFAULT 'album',
  PRIMARY KEY (`recording_id`)
) ENGINE=InnoDB AUTO_INCREMENT=805 DEFAULT CHARSET=utf8 COMMENT='Stores recordings';

--
-- Table structure for table `sinatra_recording_album`
--

DROP TABLE IF EXISTS `sinatra_recording_album`;
CREATE TABLE `sinatra_recording_album` (
  `recording_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  `album_position` int(11) NOT NULL,
  PRIMARY KEY (`recording_id`,`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `sinatra_recording_concert`
--

DROP TABLE IF EXISTS `sinatra_recording_concert`;
CREATE TABLE `sinatra_recording_concert` (
  `recording_id` int(11) NOT NULL,
  `concert_id` int(11) NOT NULL,
  `concert_position` int(11) NOT NULL,
  PRIMARY KEY (`recording_id`,`concert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `sinatra_recording_film`
--

DROP TABLE IF EXISTS `sinatra_recording_film`;
CREATE TABLE `sinatra_recording_film` (
  `recording_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `film_position` int(11) NOT NULL,
  PRIMARY KEY (`recording_id`,`film_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `sinatra_recording_person`
--

DROP TABLE IF EXISTS `sinatra_recording_person`;
CREATE TABLE `sinatra_recording_person` (
  `recording_id` int(10) unsigned NOT NULL COMMENT 'The id of the recording',
  `person_id` int(10) unsigned NOT NULL COMMENT 'The id of the person',
  `role_id` int(11) NOT NULL COMMENT 'The id of the role of the person',
  `notes` longtext COMMENT 'Notes',
  PRIMARY KEY (`recording_id`,`person_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores a relationship between a recording and person';

--
-- Table structure for table `sinatra_recording_radio`
--

DROP TABLE IF EXISTS `sinatra_recording_radio`;
CREATE TABLE `sinatra_recording_radio` (
  `recording_id` int(11) NOT NULL,
  `radio_id` int(11) NOT NULL,
  `radio_position` int(11) NOT NULL,
  PRIMARY KEY (`recording_id`,`radio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `sinatra_recording_song`
--

DROP TABLE IF EXISTS `sinatra_recording_song`;
CREATE TABLE `sinatra_recording_song` (
  `recording_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `medley_position` int(11) DEFAULT NULL,
  `parody` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`recording_id`,`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `sinatra_recording_source`
--

DROP TABLE IF EXISTS `sinatra_recording_source`;
CREATE TABLE `sinatra_recording_source` (
  `key` int(11) NOT NULL AUTO_INCREMENT,
  `recording_id` int(10) unsigned NOT NULL COMMENT 'The id of the recording',
  `source` text NOT NULL COMMENT 'The source of the link',
  `id` text NOT NULL COMMENT 'The id of the link',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=1036 DEFAULT CHARSET=utf8 COMMENT='Stores a link to a playable version of the recording';

--
-- Table structure for table `sinatra_recording_television`
--

DROP TABLE IF EXISTS `sinatra_recording_television`;
CREATE TABLE `sinatra_recording_television` (
  `recording_id` int(11) NOT NULL,
  `television_id` int(11) NOT NULL,
  `television_position` int(11) NOT NULL,
  PRIMARY KEY (`recording_id`,`television_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `sinatra_role`
--

DROP TABLE IF EXISTS `sinatra_role`;
CREATE TABLE `sinatra_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The id of the role',
  `name` text NOT NULL COMMENT 'The name of the role',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COMMENT='Stores roles';

--
-- Table structure for table `sinatra_session`
--

DROP TABLE IF EXISTS `sinatra_session`;
CREATE TABLE `sinatra_session` (
  `session_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `date_display` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=latin1;

--
-- Table structure for table `sinatra_session_recording`
--

DROP TABLE IF EXISTS `sinatra_session_recording`;
CREATE TABLE `sinatra_session_recording` (
  `session_id` int(11) NOT NULL,
  `recording_id` int(11) NOT NULL,
  `session_position` int(11) NOT NULL,
  PRIMARY KEY (`session_id`,`recording_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `sinatra_song`
--

DROP TABLE IF EXISTS `sinatra_song`;
CREATE TABLE `sinatra_song` (
  `song_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The id of the song',
  `title` text NOT NULL COMMENT 'The title of the song',
  `source` text NOT NULL COMMENT 'The source of the song',
  `year` text NOT NULL COMMENT 'The year the song was composed',
  `notes` longtext COMMENT 'Notes',
  `source_link` text,
  `song_link` text,
  PRIMARY KEY (`song_id`)
) ENGINE=InnoDB AUTO_INCREMENT=619 DEFAULT CHARSET=utf8 COMMENT='Stores songs';

--
-- Table structure for table `sinatra_song_person`
--

DROP TABLE IF EXISTS `sinatra_song_person`;
CREATE TABLE `sinatra_song_person` (
  `song_id` int(10) unsigned NOT NULL COMMENT 'The id of the song',
  `person_id` int(10) unsigned NOT NULL COMMENT 'The id of the person',
  `role_id` int(11) NOT NULL COMMENT 'The id of the role of the person',
  `notes` longtext COMMENT 'Notes',
  PRIMARY KEY (`song_id`,`person_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores a relationship between a song and person';

--
-- Table structure for table `sinatra_television`
--

DROP TABLE IF EXISTS `sinatra_television`;
CREATE TABLE `sinatra_television` (
  `television_id` int(11) NOT NULL AUTO_INCREMENT,
  `series` text NOT NULL,
  `episode` text,
  `network` text NOT NULL,
  `date` datetime NOT NULL,
  `date_display` text NOT NULL,
  `notes` longtext NOT NULL,
  `script` longtext NOT NULL,
  PRIMARY KEY (`television_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Table structure for table `sinatra_television_person`
--

DROP TABLE IF EXISTS `sinatra_television_person`;
CREATE TABLE `sinatra_television_person` (
  `television_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`television_id`,`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
