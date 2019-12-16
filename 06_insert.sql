INSERT INTO operationalDB.user VALUES 
   ( 'user1', 'marc', 'dupuis', 'k4Y5qFROXohLkjAtGOFfxdJXzl4T5mdrSUtdIEFn7eZjh1LDk95w6RfprZRfs8I', 'marc.dupuis@userhbrooke.ca'),
   ('user2', 'jonathan', 'clavet-grenier', 'qlp9rOt0dmmHEVCEe0SuVIGNnFe7NXrzcb2bHjazgS0gNn2iWgNq3voCcjdQAvC', 'jonathan.clavet-grenier@userhbrooke.ca');

INSERT INTO operationalDB.state VALUES 
   ( 1, 'backlog'),
   ( 2, 'ongoing'),
   ( 3, 'review'),
   ( 4, 'done'),
   ( 5, 'canceled'),
   ( 6, 'closed');

INSERT INTO operationalDB.project VALUES 
   ( 1, 2, 'Travail de base de donnée 1', NOW()),
   ( 2, 1, 'Travail de base de donnée 2', NOW()),
   ( 3, 1, 'Travail de base de donnée 3', NOW()),
   ( 4, 5, 'Travail de bosese de donnée x', NOW());

INSERT INTO operationalDB.priority VALUES
   (1, 'très basse'),
   (2, 'basse'),
   (3, 'moyenne'),
   (4, 'haute'),
   (5, 'très haute'),
   (6, 'critique');

INSERT INTO operationalDB.task VALUES 
   (1, 3, 2, 'Faire le script insert', 'Assurer des données cohérentes', '1.0.0.a', NOW()),
   (2, 3, 4, 'Faire la conception', 'Assurer une bonne conception', '1.2.1.a', NOW()),   
   (3, 3, 6, 'Corriger les fautes', 'Pas de fautes', '1.0.0.a', NOW()),   

   (4, 3, 2, 'Faire la conception', 'Assurer des données cohérentes', '1.0.0.a', NOW()),
   (5, 1, 1, 'Faire le script insert', 'Assurer des données cohérentes', '1.0.0.a', NOW()),

   (6, 1, 1, 'Établir plan de match pour le projet', 'Définir les taches', '1.0.0.a', NOW()),

   (7, 3, 2, 'Jalon 2', 'Fin du premier projet', '1.0.0.a', NOW()),
   (8, 3, 2, 'Jalon 3', 'Fin du deuxième projet', '1.0.0.a', NOW()),
   (9, 3, 2, 'Jalon 3', 'Fin du troisième projet', '1.0.0.a', NOW());

INSERT INTO operationalDB.project_task VALUES
   (1, 1),
   (1, 2),
   (1, 3),
   (1, 7),
   (2, 4),
   (2, 5),
   (2, 8),
   (3, 6),
   (3, 9);

INSERT INTO operationalDB.project_startdate VALUES
   (1, NOW()),
   (2, NOW()),
   (3, NOW());

INSERT INTO operationalDB.project_enddate VALUES
   (1, NOW()),
   (2, NOW()),
   (3, NOW());

INSERT INTO operationalDB.participate_project VALUES
   ('user1', 1),
   ('user1', 2),
   ('user1', 3),
   ('user2', 1),
   ('user2', 2),
   ('user2', 3);

INSERT INTO operationalDB.project_duedate VALUES
   (1, NOW()),
   (2, NOW()),
   (3, NOW());

INSERT INTO operationalDB.responsible_task VALUES
   ('user1', 1),
   ('user1', 2),
   ('user1', 3),
   ('user2', 4),
   ('user2', 5),
   ('user2', 6);

INSERT INTO operationalDB.assigned_task VALUES
   ('user1', 1),
   ('user1', 2),
   ('user1', 3),
   ('user2', 4),
   ('user2', 5),
   ('user2', 6);

INSERT INTO operationalDB.review_task VALUES
   ('user1', 1),
   ('user1', 2),
   ('user1', 3),
   ('user2', 4),
   ('user2', 5),
   ('user2', 6);

INSERT INTO operationalDB.task_milestone VALUES 
   (7),
   (8),
   (9);

INSERT INTO operationalDB.comment VALUES
   (1, 'Assurons nous de le livrer à temps...', NOW()),
   (2, 'Est-ce nécessaire??',  NOW());

INSERT INTO operationalDB.project_comment VALUES
   (1, 1);

INSERT INTO operationalDB.task_comment VALUES
   (3, 2);

INSERT INTO operationalDB.task_duedate VALUES
   (1, NOW()),
   (2, NOW()),
   (3, NOW()),
   (7, NOW());

INSERT INTO operationalDB.task_startdate VALUES
   (1, NOW()),
   (2, NOW()),
   (3, NOW()),
   (7, NOW());

INSERT INTO operationalDB.task_enddate VALUES
   (1, NOW()),
   (2, NOW()),
   (3, NOW()),
   (7, NOW());

INSERT INTO operationalDB.task_parentchild VALUES 
   (7, 1),
   (7, 2),
   (7, 3),
   (8, 4),
   (8, 5),
   (9, 6);

INSERT INTO operationalDB.worklog VALUES 
   (1, 'user1', 'faire la conception', 12, NOW()),
   (2, 'user2', 'implemented', 12, NOW());

INSERT INTO operationalDB.task_worklog VALUES 
   (1, 2),
   (2, 1);

INSERT INTO operationalDB.task_estimatedtime VALUES
   (1, 12),
   (2, 12);


