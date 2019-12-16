CREATE TABLE historicalDB.user_current (
   login VARCHAR NOT NULL,
   login_since TIMESTAMP NOT NULL,
   surname VARCHAR NOT NULL,
   surname_since TIMESTAMP NOT NULL,
   name VARCHAR NOT NULL,
   name_since TIMESTAMP NOT NULL,
   password CHAR(64) NOT NULL,
   password_since TIMESTAMP NOT NULL,
   email VARCHAR NOT NULL,
   email_since TIMESTAMP NOT NULL,

   PRIMARY KEY(login)
);

CREATE TABLE historicalDB.work_log_current (
   id_work_log INTEGER NOT NULL,
   login VARCHAR NOT NULL,
   key_since TIMESTAMP NOT NULL,
   description TEXT NOT NULL,
   description_since TIMESTAMP NOT NULL,
   hour DOUBLE PRECISION NOT NULL,
   hour_since TIMESTAMP NOT NULL,

   PRIMARY KEY(id_work_log),
   FOREIGN KEY(login) REFERENCES historicalDB.user(login)
);

CREATE TABLE historicalDB.state_current (
   id_state INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,
   name VARCHAR NOT NULL,
   name_since TIMESTAMP NOT NULL,

   PRIMARY KEY(id_state)
);

CREATE TABLE historicalDB.project_current (
   id_project INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,
   id_state INTEGER NOT NULL,
   id_state_since TIMESTAMP NOT NULL,
   name VARCHAR NOT NULL,
   name_since TIMESTAMP NOT NULL,
   description TEXT NOT NULL,
   description_since  TIMESTAMP NOT NULL,

   PRIMARY KEY(id_project),
   FOREIGN KEY(id_state) REFERENCES historicalDB.state(id_state)
);

CREATE TABLE historicalDB.comment_current (
   id_comment INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,
   text TEXT NOT NULL,
   text_since TIMESTAMP NOT NULL,

   PRIMARY KEY(id_comment)
);

CREATE TABLE historicalDB.priority_current (
   id_priority INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,
   name VARCHAR NOT NULL,
   name_since TIMESTAMP NOT NULL,

   PRIMARY KEY(id_priority)
);

CREATE TABLE historicalDB.task_current (
   id_task INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,
   id_priority INTEGER NOT NULL,
   id_priority_since TIMESTAMP NOT NULL,
   id_state INTEGER NOT NULL,
   id_state_since TIMESTAMP NOT NULL,
   name VARCHAR NOT NULL,
   name_since TIMESTAMP NOT NULL,
   description TEXT NOT NULL,
   description_since TIMESTAMP NOT NULL,

   PRIMARY KEY(id_task),
   FOREIGN KEY(id_priority) REFERENCES historicalDB.priority(id_priority),
   FOREIGN KEY(id_state) REFERENCES historicalDB.state(id_state)
);

CREATE TABLE historicalDB.responsible_task_current (
   login VARCHAR NOT NULL,
   id_task INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,

   CONSTRAINT pk_responsible_task PRIMARY KEY(login, id_task),
   FOREIGN KEY(login) REFERENCES historicalDB.user(login),
   FOREIGN KEY(id_task) REFERENCES historicalDB.task(id_task)
);

CREATE TABLE historicalDB.task_milestone_current (
   id_task INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,

   PRIMARY KEY (id_task),
   FOREIGN KEY(id_task) REFERENCES historicalDB.task(id_task)
);

CREATE TABLE historicalDB.task_startdate_current (
   id_task INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,
   start_date TIMESTAMP NOT NULL,
   start_date_since TIMESTAMP NOT NULL,

   PRIMARY KEY(id_task),
   FOREIGN KEY(id_task) REFERENCES historicalDB.task(id_task)
);

CREATE TABLE historicalDB.task_duedate_current (
   id_task INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,
   due_date TIMESTAMP NOT NULL,
   due_date_since TIMESTAMP NOT NULL,

   PRIMARY KEY(id_task),
   FOREIGN KEY(id_task) REFERENCES historicalDB.task(id_task)
);

CREATE TABLE historicalDB.task_enddate_current (
   id_task INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,
   end_date TIMESTAMP NOT NULL,
   end_date_since TIMESTAMP NOT NULL,

   PRIMARY KEY(id_task),
   FOREIGN KEY(id_task) REFERENCES historicalDB.task(id_task)
);

CREATE TABLE historicalDB.task_parentchild_current (   
   id_parent INTEGER NOT NULL,
   id_child INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,

   CONSTRAINT pk_task_parentchild PRIMARY KEY(id_parent, id_child),   
   FOREIGN KEY(id_parent) REFERENCES historicalDB.task(id_task),
   FOREIGN KEY(id_child) REFERENCES historicalDB.task(id_task)
);

CREATE TABLE historicalDB.review_task_current (
   login VARCHAR NOT NULL,
   id_task INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,

   CONSTRAINT pk_review_task PRIMARY KEY(login, id_task),
   FOREIGN KEY (id_task) REFERENCES historicalDB.task(id_task)
);

CREATE TABLE historicalDB.assigned_task_current (
   login VARCHAR NOT NULL,
   id_task INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,

   CONSTRAINT pk_assigned_task PRIMARY KEY(login, id_task),
   FOREIGN KEY(login) REFERENCES historicalDB.user(login),
   FOREIGN KEY(id_task) REFERENCES historicalDB.task(id_task)
);

CREATE TABLE historicalDB.task_work_log_current (
   id_work_log INTEGER NOT NULL,
   id_task INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,

   CONSTRAINT pk_task_work_log PRIMARY KEY(id_work_log, id_task),
   FOREIGN KEY(id_work_log) REFERENCES historicalDB.work_log(id_work_log),
   FOREIGN KEY(id_task) REFERENCES historicalDB.task(id_task)   
);

CREATE TABLE historicalDB.task_estimatedtime_current (
   id_task INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,
   hour DOUBLE PRECISION NOT NULL,
   hour_since TIMESTAMP NOT NULL,

   PRIMARY KEY(id_task),
   FOREIGN KEY(id_task) REFERENCES historicalDB.task(id_task)
);

CREATE TABLE historicalDB.participate_project_current (
   login VARCHAR NOT NULL,
   id_project INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,

   CONSTRAINT pk_participateproject PRIMARY KEY(login, id_project),
   FOREIGN KEY(login) REFERENCES historicalDB.user(login),
   FOREIGN KEY(id_project) REFERENCES historicalDB.project(id_project)
);

CREATE TABLE historicalDB.project_task_current (
   id_project INTEGER NOT NULL,
   id_task INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,

   CONSTRAINT pk_project_task PRIMARY KEY(id_project, id_task),
   FOREIGN KEY(id_project) REFERENCES historicalDB.project(id_project),
   FOREIGN KEY(id_task) REFERENCES historicalDB.task(id_task)
);

CREATE TABLE historicalDB.project_startdate_current (
   id_project INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,
   start_date TIMESTAMP NOT NULL,
   start_date_since TIMESTAMP NOT NULL,

   PRIMARY KEY(id_project),
   FOREIGN KEY(id_project) REFERENCES historicalDB.project(id_project)   
);

CREATE TABLE historicalDB.project_duedate_current (
   id_project INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,
   due_date TIMESTAMP NOT NULL,
   due_date_since TIMESTAMP NOT NULL,

   PRIMARY KEY(id_project),
   FOREIGN KEY(id_project) REFERENCES historicalDB.project(id_project)   
);

CREATE TABLE historicalDB.project_enddate_current (
   id_project INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,
   end_date TIMESTAMP NOT NULL,
   end_date_since TIMESTAMP NOT NULL,

   PRIMARY KEY(id_project),
   FOREIGN KEY(id_project) REFERENCES historicalDB.project(id_project)   
);

CREATE TABLE historicalDB.project_comment_current (
   id_project INTEGER NOT NULL,   
   id_comment INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,   

   CONSTRAINT pk_project_commentid PRIMARY KEY(id_project, id_comment),
   FOREIGN KEY(id_project) REFERENCES historicalDB.project(id_project),
   FOREIGN KEY(id_comment) REFERENCES historicalDB.comment(id_comment)
);

CREATE TABLE historicalDB.task_comment_current (
   id_task INTEGER NOT NULL,
   id_comment INTEGER NOT NULL,
   key_since TIMESTAMP NOT NULL,

   CONSTRAINT pk_task_comment PRIMARY KEY(id_task, id_comment),
   FOREIGN KEY(id_task) REFERENCES historicalDB.task(id_task),
   FOREIGN KEY(id_comment) REFERENCES historicalDB.comment(id_comment)
);
