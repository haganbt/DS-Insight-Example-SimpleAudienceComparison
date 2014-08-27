/**
 * Gender by volume
 */
select t.label, m.demographic_sex, count(*) from
Master m
LEFT OUTER JOIN tags t ON t.interaction_id = m.interaction_id
where m.demographic_sex is not null
group by t.label, m.demographic_sex
;

/**
 * Gender by volume - percentages
 */
SELECT t.label, m.demographic_sex, COUNT(*), COUNT(*) / total_t.total_cnt as percentage
FROM Master m LEFT OUTER JOIN tags t ON t.interaction_id = m.interaction_id
    INNER JOIN (SELECT label, COUNT(*) AS total_cnt
                FROM tags
                GROUP BY label
    ) total_t ON total_t.label = t.label
/*WHERE m.demographic_sex is not null*/
GROUP BY t.label, m.demographic_sex
;