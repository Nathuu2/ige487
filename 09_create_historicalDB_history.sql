CREATE TABLE historicaldb.review_task_id_history (
      login VARCHAR NOT NULL,
      id_task INT NOT NULL,
      valid DATERANGE NOT NULL,

      PRIMARY KEY(login, id_task, valid)   
);

CREATE TABLE historicaldb.responsible_task_id_history (
      login VARCHAR NOT NULL,
      id_task INT NOT NULL,
      valid DATERANGE NOT NULL,

      PRIMARY KEY(login, id_task, valid)   
);

CREATE TABLE historicaldb.assigned_task_id_history (
      login VARCHAR NOT NULL,
      id_task INT NOT NULL,
      valid DATERANGE NOT NULL,

      PRIMARY KEY(login, id_task, valid)   
);

CREATE TABLE historicaldb.work_log_id_history (
      login VARCHAR NOT NULL,
      id_work_log INT NOT NULL,
      valid DATERANGE NOT NULL,

      PRIMARY KEY(login, id_work_log, valid)   
);

CREATE TABLE historicaldb.work_log_hour_history (
      login VARCHAR NOT NULL,
      id_work_log VARCHAR NOT NULL,
      valid DATERANGE NOT NULL,
      hour DOUBLE PRECISION NOT NULL,

      PRIMARY KEY(login, id_work_log, valid)   
);

CREATE TABLE historicaldb.work_log_description_history (
      login VARCHAR NOT NULL,
      id_work_log VARCHAR NOT NULL,
      valid DATERANGE NOT NULL,
      description TEXT NOT NULL,

      PRIMARY KEY(login, id_work_log, valid)   
);

CREATE TABLE historicaldb.task_work_log_id_history (
      id_work_log INT NOT NULL,
      id_task INT NOT NULL,
      valid DATERANGE NOT NULL,

      PRIMARY KEY(id_work_log, id_task, valid)   
);

-- USER 
CREATE TABLE historicaldb.user_login_history (
      login VARCHAR NOT NULL,
      valid DATERANGE NOT NULL,

      PRIMARY KEY(id_work_log, id_task, valid)   
);

CREATE TABLE historicaldb.user_password_history (
      login VARCHAR NOT NULL,
      valid DATERANGE NOT NULL,
      password CHAR(64) NOT NULL, 

      PRIMARY KEY(login, valid)   
);

CREATE TABLE historicaldb.user_email_history (
      login VARCHAR NOT NULL,
      valid DATERANGE NOT NULL,
      email VARCHAR NOT NULL,

      PRIMARY KEY(login, valid)   
);

CREATE TABLE historicaldb.user_name_history (
      login VARCHAR NOT NULL,
      valid DATERANGE NOT NULL,
      name VARCHAR NOT NULL,

      PRIMARY KEY(login, valid)   
);

CREATE TABLE historicaldb.user_surname_history (
      login VARCHAR NOT NULL,
      valid DATERANGE NOT NULL,
      surname VARCHAR NOT NULL,

      PRIMARY KEY(login, valid)   
);

CREATE TABLE historicaldb.participate_project_id_history (
      login VARCHAR NOT NULL,
      id_project INT NOT NULL, 
      valid DATERANGE NOT NULL,

      PRIMARY KEY(login, valid)   
);

CREATE TABLE historicaldb.project_due_date_due_date_history (
      id_project INT NOT NULL,
      valid DATERANGE NOT NULL,
      due_date DATERANGE NOT NULL,

      PRIMARY KEY(id_project, valid)   
);

CREATE TABLE historicaldb.project_start_date_start_date_history (
      id_project INT NOT NULL,
      valid DATERANGE NOT NULL,
      start_date DATERANGE NOT NULL,

      PRIMARY KEY(id_project, valid)   
);

CREATE TABLE historicaldb.priority_name_history (
      id_priority INT NOT NULL,
      valid DATERANGE NOT NULL,

      PRIMARY KEY(id_priority, valid)   
);

CREATE TABLE historicaldb.priority_id_history (
      id_project INT NOT NULL,
      valid DATERANGE NOT NULL,
      name VARCHAR NOT NULL,

      PRIMARY KEY(id_project, valid)   
);


-- PROJECT 
CREATE TABLE historicaldb.project_id_history (
      id_project INT NOT NULL,
      valid DATERANGE NOT NULL,

      PRIMARY KEY(id_project, valid)   
);

CREATE TABLE historicaldb.project_name_history (
      id_project INT NOT NULL,
      valid DATERANGE NOT NULL,
      name VARCHAR NOT NULL,

      PRIMARY KEY(id_project, valid)   
);

CREATE TABLE historicaldb.project_id_state_history (
      id_project INT NOT NULL,
      valid DATERANGE NOT NULL,
      id_state INT NOT NULL,

      PRIMARY KEY(id_project, valid)   
);

CREATE TABLE historicaldb.project_description_history (
      id_project INT NOT NULL,
      valid DATERANGE NOT NULL,
      description TEXT NOT NULL,

      PRIMARY KEY(id_project, valid)   
);

CREATE TABLE historicaldb.project_task_id_history (
      id_project INT NOT NULL,
      id_task INT NOT NULL,
      valid DATERANGE NOT NULL,

      PRIMARY KEY(id_project, id_task, valid)   
);

CREATE TABLE historicaldb.project_description_history (
      id_project INT NOT NULL,
      valid DATERANGE NOT NULL,
      end_date TIMESTAMP NOT NULL,

      PRIMARY KEY(id_project, valid)   
);

CREATE TABLE historicaldb.project_comment_id_history (
      id_project INT NOT NULL,
      id_comment INT NOT NULL,
      valid DATERANGE NOT NULL,

      PRIMARY KEY(id_project, id_comment, valid)   
);

-- TASK

CREATE TABLE historicaldb.task_id_history (
      id_task INT NOT NULL,
      valid DATERANGE NOT NULL,

      PRIMARY KEY(id_project, valid)   
);

CREATE TABLE historicaldb.task_priority_history (
      id_project INT NOT NULL,
      valid DATERANGE NOT NULL,
      id_priority INT NOT NULL,

      PRIMARY KEY(id_project, valid)   
);

CREATE TABLE historicaldb.task_description_history (
      id_project INT NOT NULL,
      valid DATERANGE NOT NULL,
      description TEXT NOT NULL,

      PRIMARY KEY(id_project, valid)   
);

CREATE TABLE historicaldb.task_state_history (
      id_project INT NOT NULL,
      valid DATERANGE NOT NULL,
      id_state INT NOT NULL, 

      PRIMARY KEY(id_project, valid)   
);

CREATE TABLE historicaldb.task_name_history (
      id_project INT NOT NULL,
      valid DATERANGE NOT NULL,
      name VARCHAR NOT NULL, 

      PRIMARY KEY(id_project, valid)   
);

CREATE TABLE historicaldb.task_estimate_history (
      id_project INT NOT NULL,
      valid DATERANGE NOT NULL,
      hour DOUBLE PRECISION NOT NULL, 

      PRIMARY KEY(id_project, valid)   
);

CREATE TABLE historicaldb.task_due_date_history (
      id_project INT NOT NULL,
      valid DATERANGE NOT NULL,
      due_date TIMESTAMP NOT NULL, 

      PRIMARY KEY(id_project, valid)   
);

CREATE TABLE historicaldb.task_start_date_history (
      id_project INT NOT NULL,
      valid DATERANGE NOT NULL,
      start_date TIMESTAMP NOT NULL, 

      PRIMARY KEY(id_project, valid)   
);

CREATE TABLE historicaldb.task_end_date_history (
      id_project INT NOT NULL,
      valid DATERANGE NOT NULL,
      end_date TIMESTAMP NOT NULL, 

      PRIMARY KEY(id_project, valid)   
);

CREATE TABLE historicaldb.parent_child_id_history (
      id_parent INT NOT NULL,
      id_child INT NOT NULL,
      valid DATERANGE NOT NULL,

      PRIMARY KEY(id_parent, id_child, valid)   
);

CREATE TABLE historicaldb.milestone_id_history (
      id_project INT NOT NULL,
      valid DATERANGE NOT NULL,

      PRIMARY KEY(id_project, valid)   
);

CREATE TABLE historicaldb.task_comment_id_history (
      id_task INT NOT NULL,
      id_comment INT NOT NULL,
      valid DATERANGE NOT NULL,

      PRIMARY KEY(id_task, id_comment, valid)   
);

-- STATE
CREATE TABLE historicaldb.state_id_history (
      id_state INT NOT NULL,
      valid DATERANGE NOT NULL,

      PRIMARY KEY(id_state, valid)   
);

CREATE TABLE historicaldb.state_name_history (
      id_state INT NOT NULL,
      valid DATERANGE NOT NULL,
      name VARCHAR NOT NULL,

      PRIMARY KEY(id_state, valid)   
);

-- COMMENT
CREATE TABLE historicaldb.comment_id_history (
      id_comment INT NOT NULL,
      valid DATERANGE NOT NULL,

      PRIMARY KEY(id_comment, valid)   
);

CREATE TABLE historicaldb.comment_text_history (
      id_comment INT NOT NULL,
      valid DATERANGE NOT NULL,
      text TEXT NOT NULL,

      PRIMARY KEY(id_comment, valid)   
);