SELECT d.item_id, COUNT(d.item_id) AS cnt;
FROM deal d INTO CURSOR tmp;
WHERE d.date_end > DATE();
GROUP BY d.item_id

SELECT tmp.item_id, i.name, tmp.cnt;
FROM item i, tmp;
WHERE i.item_id = tmp.item_id AND tmp.cnt IN (SELECT MAX(tmp.cnt) FROM tmp);
ORDER BY tmp.item_id
