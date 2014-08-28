-- MySQL TABLE

DROP TABLE IF EXISTS master;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS demographic_likes_and_interests;

CREATE TABLE master (
  interaction_id VARCHAR(64) NOT NULL,
  interaction_type VARCHAR(64) NOT NULL,
  interaction_author_hash_id VARCHAR(64) NOT NULL,
  created_at datetime NOT NULL,
  tag VARCHAR(255) NOT NULL,
  subscription_id VARCHAR(64) NOT NULL,
  task_hash VARCHAR(64) NULL,
  task_type VARCHAR(64) NULL,
  source VARCHAR(64) NULL,
  interaction_link VARCHAR(255) NULL,
  klout_score INT NULL,
  gender VARCHAR(64) NULL,
  twitter_id VARCHAR(64) NULL,
  geo_latitude DOUBLE NULL,
  geo_longitude DOUBLE NULL,
  content text NULL,
  content_sentiment INT NULL,
  language VARCHAR(64) NULL,
  language_confidence INT NULL,
  is_retweet integer NULL,
  retweet_count INT NULL,
  twitter_in_reply_to_user_hash_id VARCHAR(64) NULL,
  twitter_retweeted_user_hash_id VARCHAR(64) NULL,
  twitter_lang VARCHAR(64) NULL,
  twitter_source VARCHAR(64) NULL,
  twitter_text VARCHAR(255) NOT NULL,
  twitter_possibly_sensitive VARCHAR(64) NULL,
  in_reply_to_status_id VARCHAR(64) NULL,
  status VARCHAR(64) NULL,
  retweet_time_elapsed INT NULL,
  user_geo_enabled INT NULL,
  user_statuses_count INT NULL,
  user_time_zone VARCHAR(64) NULL,
  user_description VARCHAR(64) NULL,
  user_follower_ratio DOUBLE NULL,
  user_followers_count INT NULL,
  user_friends_count INT NULL,
  user_favourites_count INT NULL,
  user_url VARCHAR(64) NULL,
  user_lang VARCHAR(64) NULL,
  user_verified INT  NULL,
  user_listed_count INT NULL,
  user_location VARCHAR(64) NULL,
  user_timezone VARCHAR(64) NULL,
  twitter_place_country VARCHAR(64) NULL,
  twitter_filter_level VARCHAR(64) NULL,
  demographic_location_us_state VARCHAR(64) NULL,
  demographic_location_city VARCHAR(64) NULL,
  demographic_services VARCHAR(255) NULL,
  demographic_twitter_accounts_large VARCHAR(255) NULL,
  demographic_age_range_start VARCHAR(64) NULL,
  demographic_age_range_end VARCHAR(64) NULL,
  demographic_main_street_dressed_by VARCHAR(255) NULL,
  demographic_twitter_activity VARCHAR(64) NULL,
  demographic_main_street_eat_and_drink_at VARCHAR(64) NULL,
  demographic_location_country VARCHAR(64) NULL,
  demographic_main_street_shop_at VARCHAR(64) NULL,
  demographic_type VARCHAR(64) NULL,
  demographic_accounts_categories VARCHAR(255) NULL,
  demographic_sex VARCHAR(64) NULL,
  demographic_status_relationship VARCHAR(64) NULL,
  demographic_status_work VARCHAR(64) NULL,
  demographic_likes_and_interests VARCHAR(255) NULL,
  demographic_first_language VARCHAR(64) NULL,
  demographic_professions VARCHAR(255) NULL,
  hashtag VARCHAR(255) NULL,
  mention VARCHAR(255) NULL,
  url VARCHAR(255) NULL,
  title VARCHAR(255) NULL,
  domain VARCHAR(255) NULL,
  normalized_url VARCHAR(64) NULL
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE tags (
  interaction_id VARCHAR(64) NOT NULL,
  interaction_type VARCHAR(64) NOT NULL,
  created_at datetime NOT NULL,
  label VARCHAR(255) NOT NULL,
  INDEX old_tags_interaction_id_idx (interaction_id),
  INDEX old_tags_interaction_type_idx (interaction_type),
  INDEX old_tags_created_at_idx (created_at)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE demographic_likes_and_interests (
  interaction_id VARCHAR(64) NOT NULL,
  interaction_type VARCHAR(50) NOT NULL,
  created_at DATETIME NOT NULL,
  twitter_id VARCHAR(64) NULL,
  interest VARCHAR(255) DEFAULT NULL
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;
