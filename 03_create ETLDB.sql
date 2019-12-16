CREATE OR REPLACE PROCEDURE ETL.workLogMart()
LANGUAGE plpgsql    
AS $$
BEGIN
   INSERT INTO analyticDB.user_dimension
   SELECT login, surname, name, password, email FROM operationalDB.user;

   INSERT INTO analyticDB.task_dimension
   SELECT id_task, name, description, version FROM operationalDB.task;
      
   INSERT INTO analyticDB.work_log_fact (login, id_task, week_date, hours)
   SELECT muser.login, 
          mtask_worklog.id_task, 
          date_trunc('week', mworklog.last_modified)::DATE AS week_date, 
          SUM(mworklog.hour) AS hours
   FROM operationalDB.worklog as mworklog
   NATURAL JOIN operationalDB.task_worklog AS mtask_worklog
   NATURAL JOIN operationalDB.user as muser   
   GROUP BY (muser.login, mtask_worklog.id_task, week_date);
   
   COMMIT;
END;
$$;

CREATE OR REPLACE PROCEDURE ETL.extractProjectTask()
LANGUAGE plpgsql    
AS $$
BEGIN

   INSERT INTO analyticDB.state_dimension
   SELECT * FROM operationalDB.state;

   INSERT INTO analyticDB.priority_dimension
   SELECT * FROM operationalDB.priority;

   INSERT INTO analyticDB.project_dimension
   SELECT id_project, 
          name
         FROM operationalDB.project;

   INSERT INTO analyticDB.task_fact (id_state, id_priority, id_project, hours_logged)
   SELECT mstate.id_state, mpriority.id_priority, mproject_task.id_project, SUM(mwork_log.hour)  
      FROM operationalDB.task AS mtask
      INNER JOIN operationalDB.priority as mpriority ON mpriority.id_priority = mtask.id_priority
      INNER JOIN operationalDB.project_task as mproject_task ON mtask.id_task = mproject_task.id_task
      INNER JOIN operationalDB.state as mstate ON mtask.id_state = mstate.id_state
      INNER JOIN operationalDB.task_worklog as mtask_worklog ON mtask.id_task = mtask_worklog.id_task
      INNER JOIN operationalDB.worklog as mwork_log ON mtask_worklog.id_worklog = mwork_log.id_worklog
      GROUP BY (mstate.id_state, mpriority.id_priority, mproject_task.id_project);
    
   COMMIT;
END;
$$;
