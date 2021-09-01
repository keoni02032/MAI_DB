SELECT c.client_id, c.surname, SUM(d.cost) AS total_sum;
FROM client AS c, deal AS d INTO CURSOR tmp;
WHERE c.client_id = d.client_id;
GROUP BY c.client_id, c.surname

SELECT tmp.client_id, tmp.surname, total_sum;
FROM tmp;
WHERE total_sum IN (SELECT MAX(total_sum) FROM tmp)