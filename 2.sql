SELECT DISTINCT w.worker_id, w.surname;
FROM worker w, deal d1;
WHERE w.worker_id = d1.worker_id;
    AND d1.worker_id NOT IN (SELECT d2.worker_id FROM deal d2 WHERE d2.client_id = 2 AND d2.date_begin BETWEEN CTOD('03/15/20') AND CTOD('03/30/20'))
ORDER BY w.worker_id
