
--- Work log Mart
CREATE TABLE analyticDB.user_dimension (
   login VARCHAR NOT NULL,
   surname VARCHAR NOT NULL,
   name VARCHAR NOT NULL,
   password CHAR(64) NOT NULL,
   email VARCHAR NOT NULL,

   PRIMARY KEY(login)   
);

CREATE TABLE analyticDB.task_dimension (
   id_task INT NOT NULL,
   name VARCHAR NOT NULL,
   description TEXT NOT NULL,
   version VARCHAR NOT NULL,

   PRIMARY KEY(id_task)
);

CREATE TABLE analyticDB.work_week_dimension (
   week_date DATE NOT NULL,

   PRIMARY KEY(week_date)
);

CREATE TABLE analyticDB.work_log_fact (
   id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
   login VARCHAR NOT NULL,
   id_task INT NOT NULL,
   week_date DATE NOT NULL,
   hours DOUBLE PRECISION NOT NULL,

   PRIMARY KEY(id),
   FOREIGN KEY(login) REFERENCES analyticDB.user_dimension(login), 
   FOREIGN KEY(id_task) REFERENCES analyticDB.task_dimension(id_task), 
   FOREIGN KEY(week_date) REFERENCES analyticDB.work_week_dimension(week_date)
);

--- Project's tasks mart
CREATE TABLE analyticDB.state_dimension (
   id_state INT NOT NULL,
   name VARCHAR NOT NULL,

   PRIMARY KEY(id_state)   
);

CREATE TABLE analyticDB.priority_dimension (
   id_priority INT NOT NULL,
   name VARCHAR NOT NULL,   

   PRIMARY KEY(id_priority)
);

CREATE TABLE analyticDB.project_dimension (
   id_project INT NOT NULL,   
   name VARCHAR NOT NULL,
   
   PRIMARY KEY(id_project)
);

CREATE TABLE analyticDB.task_fact (
   id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
   id_state INT NOT NULL,   
   id_priority INT NOT NULL,
   id_project INT NOT NULL,
   hours_logged DOUBLE PRECISION NOT NULL,
   
   PRIMARY KEY(id),
   FOREIGN KEY(id_state) REFERENCES analyticDB.state_dimension(id_state),
   FOREIGN KEY(id_priority) REFERENCES analyticDB.priority_dimension(id_priority),
   FOREIGN KEY(id_project) REFERENCES analyticDB.project_dimension(id_project)
);