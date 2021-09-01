SELECT DISTINCT w.surname AS Worker, c1.surname AS client_1, c2.surname AS client_2;
FROM deal d1, deal d2, worker w, client c1, client c2;
WHERE d1.worker_id = d2.worker_id;
	AND w.worker_id = d1.worker_id;
	AND d1.date_begin BETWEEN CTOD('03/15/20') AND CTOD('03/30/20');
	AND d2.date_begin BETWEEN CTOD('03/15/20') AND CTOD('03/30/20');
	AND d1.client_id > d2.client_id AND d1.client_id = c1.client_id AND d2.client_id = c2.client_id;
ORDER BY w.surname