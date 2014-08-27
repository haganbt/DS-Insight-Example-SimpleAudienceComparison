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
 * Demographic Age Ranges
 */
SELECT
	t.label,
	CONCAT(m.demographic_age_range_start,' to ',m.demographic_age_range_end) AS age_range,
	COUNT(CONCAT(m.demographic_age_range_start,' to ',m.demographic_age_range_end)) AS count
FROM master m
LEFT OUTER JOIN tags t ON t.interaction_id = m.interaction_id
WHERE m.demographic_age_range_start IS NOT NULL
GROUP BY t.label, age_range
;