SELECT d.item_id, COUNT(d.item_id) AS cnt;
FROM deal d INTO CURSOR tmp;
GROUP BY d.item_id

SELECT i.item_id, i.name, tmp.cnt;
FROM item i, tmp;
WHERE i.item_id = tmp.item_id AND tmp.cnt > (SELECT AVG(tmp.cnt) FROM tmp)