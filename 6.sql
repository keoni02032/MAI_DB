SELECT d.*;
FROM deal d;
WHERE  Exists (SELECT item_id FROM deal d WHERE d.date_begin BETWEEN CTOD('03/15/20') AND CTOD('03/30/20'));
    AND  d.cost > ALL (SELECT d.cost FROM deal d WHERE d.date_begin BETWEEN CTOD('03/15/20') AND CTOD('03/30/20'));
    AND  d.item_id <> ANY (SELECT d.item_id FROM deal d WHERE d.date_begin BETWEEN CTOD('03/15/20') AND CTOD('03/30/20'))