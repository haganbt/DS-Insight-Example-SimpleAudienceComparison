/**
 * Create indexes on interaction_id
 */
CREATE INDEX master_interaction_id ON master (interaction_id);
CREATE INDEX tags_interaction_id ON tags (interaction_id);
CREATE INDEX demographic_likes_and_interests_interaction_id ON demographic_likes_and_interests (interaction_id);


/**
 * Drop any duplicate user data from master
 */
ALTER IGNORE TABLE `master` ADD UNIQUE INDEX (`twitter_id`);

/**
 * Gender by volume
 */
select t.label, m.demographic_sex, count(*)
FROM
    master m
LEFT OUTER JOIN tags t ON t.interaction_id = m.interaction_id
WHERE m.demographic_sex is not null
GROUP BY t.label, m.demographic_sex
;

/**
 * Gender by volume - percentages
 */
SELECT t.label, m.demographic_sex, COUNT(*), COUNT(*) / total_t.total_cnt as percentage
FROM master m LEFT OUTER JOIN tags t ON t.interaction_id = m.interaction_id
    INNER JOIN (SELECT label, COUNT(*) AS total_cnt
                FROM tags
                GROUP BY label
    ) total_t ON total_t.label = t.label
WHERE m.demographic_sex is not null
GROUP BY t.label, m.demographic_sex
;

/**
 * Demographic Age Ranges Percentages
 */
SELECT
	t.label,
	COUNT(*) / total_t.total_cnt as percentage,
	CONCAT(m.demographic_age_range_start,' to ',m.demographic_age_range_end) as age_range,
	COUNT(CONCAT(m.demographic_age_range_start,' to ',m.demographic_age_range_end)) AS count
FROM master m LEFT OUTER JOIN tags t ON t.interaction_id = m.interaction_id
    INNER JOIN (SELECT label, COUNT(*) AS total_cnt
                FROM tags p, master d
                where p.interaction_id = d.interaction_id
                and d.demographic_age_range_start is not null
				and  d.demographic_age_range_end is not null
                GROUP BY p.label
    ) total_t ON total_t.label = t.label
where m.demographic_age_range_start is not null
and  m.demographic_age_range_end is not null
group by t.label, age_range
order by age_range, t.label
;