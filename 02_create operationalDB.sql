CREATE TABLE operationalDB.user (
   login VARCHAR NOT NULL,
   surname VARCHAR NOT NULL,
   name VARCHAR NOT NULL,
   password CHAR(64) NOT NULL,
   email VARCHAR NOT NULL,

   PRIMARY KEY(login)
);

CREATE TABLE operationalDB.worklog (
   id_worklog INTEGER NOT NULL,
   login VARCHAR NOT NULL,
   description TEXT NOT NULL,
   hour DOUBLE PRECISION NOT NULL,
   last_modified TIMESTAMP NOT NULL,

   PRIMARY KEY(id_worklog),
   FOREIGN KEY(login) REFERENCES operationalDB.user(login)
);

CREATE TABLE operationalDB.state (
   id_state INTEGER NOT NULL,
   name VARCHAR NOT NULL,

   PRIMARY KEY(id_state)
);

CREATE TABLE operationalDB.project (
   id_project INTEGER NOT NULL,
   id_state INTEGER NOT NULL,
   name VARCHAR NOT NULL,
   last_modified TIMESTAMP NOT NULL,

   PRIMARY KEY(id_project),
   FOREIGN KEY(id_state) REFERENCES operationalDB.state(id_state)
);

CREATE TABLE operationalDB.comment (
   id_comment INTEGER NOT NULL,
   text TEXT NOT NULL,
   date TIMESTAMP NOT NULL,

   PRIMARY KEY(id_comment)
);

CREATE TABLE operationalDB.priority (
   id_priority INTEGER NOT NULL,
   name VARCHAR NOT NULL,

   PRIMARY KEY(id_priority)
);

CREATE TABLE operationalDB.task (
   id_task INTEGER NOT NULL,
   id_priority INTEGER NOT NULL,
   id_state INTEGER NOT NULL,
   name VARCHAR NOT NULL,
   description TEXT NOT NULL,
   version VARCHAR NOT NULL,
   last_modified TIMESTAMP NOT NULL,

   PRIMARY KEY(id_task),
   FOREIGN KEY(id_priority) REFERENCES operationalDB.priority(id_priority),
   FOREIGN KEY(id_state) REFERENCES operationalDB.state(id_state)
);

CREATE TABLE operationalDB.responsible_task (
   login VARCHAR NOT NULL,
   id_task INTEGER NOT NULL,

   CONSTRAINT pk_responsible_task PRIMARY KEY(login, id_task),
   FOREIGN KEY(login) REFERENCES operationalDB.user(login),
   FOREIGN KEY(id_task) REFERENCES operationalDB.task(id_task)
);

CREATE TABLE operationalDB.task_milestone (
   id_task INTEGER NOT NULL,

   PRIMARY KEY (id_task),
   FOREIGN KEY(id_task) REFERENCES operationalDB.task(id_task)
);

CREATE TABLE operationalDB.task_startdate (
   id_task INTEGER NOT NULL,
   start_date TIMESTAMP NOT NULL,

   PRIMARY KEY(id_task),
   FOREIGN KEY(id_task) REFERENCES operationalDB.task(id_task)
);

CREATE TABLE operationalDB.task_duedate (
   id_task INTEGER NOT NULL,
   due_date TIMESTAMP NOT NULL,

   PRIMARY KEY(id_task),
   FOREIGN KEY(id_task) REFERENCES operationalDB.task(id_task)
);

CREATE TABLE operationalDB.task_enddate (
   id_task INTEGER NOT NULL,
   end_date TIMESTAMP NOT NULL,

   PRIMARY KEY(id_task),
   FOREIGN KEY(id_task) REFERENCES operationalDB.task(id_task)
);

CREATE TABLE operationalDB.task_parentchild (   
   id_parent INTEGER NOT NULL,
   id_child INTEGER NOT NULL,

   CONSTRAINT pk_task_parentchild PRIMARY KEY(id_parent, id_child),   
   FOREIGN KEY(id_parent) REFERENCES operationalDB.task(id_task),
   FOREIGN KEY(id_child) REFERENCES operationalDB.task(id_task)
);

CREATE TABLE operationalDB.review_task (
   login VARCHAR NOT NULL,
   id_task INTEGER NOT NULL,

   CONSTRAINT pk_review_task PRIMARY KEY(login, id_task),
   FOREIGN KEY (id_task) REFERENCES operationalDB.task(id_task)
);

CREATE TABLE operationalDB.assigned_task (
   login VARCHAR NOT NULL,
   id_task INTEGER NOT NULL,

   CONSTRAINT pk_assigned_task PRIMARY KEY(login, id_task),
   FOREIGN KEY(login) REFERENCES operationalDB.user(login),
   FOREIGN KEY(id_task) REFERENCES operationalDB.task(id_task)
);

CREATE TABLE operationalDB.task_worklog (
   id_worklog INTEGER NOT NULL,
   id_task INTEGER NOT NULL,

   CONSTRAINT pk_task_worklog PRIMARY KEY(id_worklog, id_task),
   FOREIGN KEY(id_worklog) REFERENCES operationalDB.worklog(id_worklog),
   FOREIGN KEY(id_task) REFERENCES operationalDB.task(id_task)   
);

CREATE TABLE operationalDB.task_estimatedtime (
   id_task INTEGER NOT NULL,
   hour DOUBLE PRECISION NOT NULL,

   PRIMARY KEY(id_task),
   FOREIGN KEY(id_task) REFERENCES operationalDB.task(id_task)
);

CREATE TABLE operationalDB.participate_project (
   login VARCHAR NOT NULL,
   id_project INTEGER NOT NULL,

   CONSTRAINT pk_participateproject PRIMARY KEY(login, id_project),
   FOREIGN KEY(login) REFERENCES operationalDB.user(login),
   FOREIGN KEY(id_project) REFERENCES operationalDB.project(id_project)
);

CREATE TABLE operationalDB.project_task (
   id_project INTEGER NOT NULL,
   id_task INTEGER NOT NULL,

   CONSTRAINT pk_project_task PRIMARY KEY(id_project, id_task),
   FOREIGN KEY(id_project) REFERENCES operationalDB.project(id_project),
   FOREIGN KEY(id_task) REFERENCES operationalDB.task(id_task)
);

CREATE TABLE operationalDB.project_startdate (
   id_project INTEGER NOT NULL,
   start_date TIMESTAMP NOT NULL,

   PRIMARY KEY(id_project),
   FOREIGN KEY(id_project) REFERENCES operationalDB.project(id_project)   
);

CREATE TABLE operationalDB.project_duedate (
   id_project INTEGER NOT NULL,
   due_date TIMESTAMP NOT NULL,

   PRIMARY KEY(id_project),
   FOREIGN KEY(id_project) REFERENCES operationalDB.project(id_project)   
);

CREATE TABLE operationalDB.project_enddate (
   id_project INTEGER NOT NULL,
   end_date TIMESTAMP NOT NULL,

   PRIMARY KEY(id_project),
   FOREIGN KEY(id_project) REFERENCES operationalDB.project(id_project)   
);

CREATE TABLE operationalDB.project_comment (
   id_project INTEGER NOT NULL,
   id_comment INTEGER NOT NULL,

   CONSTRAINT pk_project_commentid PRIMARY KEY(id_project, id_comment),
   FOREIGN KEY(id_project) REFERENCES operationalDB.project(id_project),
   FOREIGN KEY(id_comment) REFERENCES operationalDB.comment(id_comment)
);

CREATE TABLE operationalDB.task_comment (
   id_task INTEGER NOT NULL,
   id_comment INTEGER NOT NULL,

   CONSTRAINT pk_task_comment PRIMARY KEY(id_task, id_comment),
   FOREIGN KEY(id_task) REFERENCES operationalDB.task(id_task),
   FOREIGN KEY(id_comment) REFERENCES operationalDB.comment(id_comment)
);
