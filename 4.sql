SELECT c.client_id, c.surname, SUM(d.cost * (1 + d.percent / 100)) AS total_income;
FROM client AS c, deal AS d INTO CURSOR temp;
WHERE c.client_id = d.client_id AND d.date_end < DATE();
GROUP BY c.client_id, c.surname

SELECT temp.client_id, temp.surname, total_income;
FROM temp;
WHERE total_income IN (SELECT MAX(total_income) FROM temp)