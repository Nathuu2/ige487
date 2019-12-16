-- SCHÉMAS INTERNE NON DISPONIBLE POUR L'EXTERNE

-- USER PROC

CREATE OR REPLACE PROCEDURE historicaldb.insert_user(_login VARCHAR, _surname VARCHAR, _name VARCHAR, _password CHAR(64), _email VARCHAR)
LANGUAGE plpgsql    
AS $$
DECLARE 
   _record RECORD;
BEGIN 
   INSERT INTO historicalDB.user_current 
   (login, surname, name, password, email, login_since, surname_since, name_since, password_since, email_since)
   VALUES (_login, _surname, _name, _password, _email, NOW(),NOW(),NOW(),NOW(),NOW())
   ON CONFLICT DO NOTHING;   
    
   COMMIT;
END;
$$;

CREATE OR REPLACE PROCEDURE historicaldb.update_user(_login VARCHAR, _surname VARCHAR, _name VARCHAR, _password CHAR(64), _email VARCHAR)
LANGUAGE plpgsql    
AS $$
DECLARE 
   _record RECORD;
BEGIN 
      SELECT INTO _record 
      login, surname, name, password, email, login_since, surname_since, name_since, password_since, email_since 
      FROM historicalDB.user_current AS uc
      WHERE uc.login = _login;
      
      IF(_record IS NOT NULL) THEN
            -- Handle historical db and current 
            IF(_surname IS NOT NULL AND _record.surname <> _surname) THEN 
                  INSERT INTO historicaldb.user_surname_history (login, valid, surname)
                  VALUES (_record.login, tsrange(_record.surname_since, NOW()), _record.surname);
                  UPDATE historicalDB.user_current SET surname = _surname, surname_since = NOW() WHERE login = _record.login;
            END IF;
            IF(_name IS NOT NULL AND _record.name <> _name) THEN 
                  INSERT INTO historicaldb.user_name_history (login, valid, name)
                  VALUES (_record.login, tsrange(_record.name_since, NOW()), _record.name);
                  UPDATE historicalDB.user_current SET _name = _name, name_since = NOW() WHERE login = _record.login;
            END IF;
            IF(_password IS NOT NULL AND _record.password <> _password) THEN 
                  INSERT INTO historicaldb.user_password_history (login, valid, password)
                  VALUES (_record.login, tsrange(_record.password_since, NOW()), _record.password);
                  UPDATE historicalDB.user_current SET password = _password, password_since = NOW() WHERE login = _record.login;
            END IF;
            IF(_email IS NOT NULL AND _record.email <> _email) THEN 
                  INSERT INTO historicaldb.user_email_history (login, valid, email)
                  VALUES (_record.login, tsrange(_record.email_since, NOW()), _record.email);
                  UPDATE historicalDB.user_current SET email = _email, email_since = NOW() WHERE login = _record.login;
            END IF;
      END IF;
      COMMIT;
END;
$$;

CREATE OR REPLACE PROCEDURE historicaldb.delete_user(_login VARCHAR)
LANGUAGE plpgsql    
AS $$
DECLARE 
   _record RECORD;
BEGIN 
      SELECT INTO _record 
      login, surname, name, password, email, login_since, surname_since, name_since, password_since, email_since 
      FROM historicalDB.user_current AS uc
      WHERE uc.login = _login;
      
      IF(_record IS NOT NULL) THEN
            INSERT INTO historicaldb.user_surname_history (login, valid, surname)
            VALUES (_record.login, tsrange(_record.surname_since, NOW()), _record.surname);      
      
            INSERT INTO historicaldb.user_name_history (login, valid, name)
            VALUES (_record.login, tsrange(_record.name_since, NOW()), _record.name);      
      
            INSERT INTO historicaldb.user_password_history (login, valid, password)
            VALUES (_record.login, tsrange(_record.password_since, NOW()), _record.password);      
      
            INSERT INTO historicaldb.user_email_history (login, valid, email)
            VALUES (_record.login, tsrange(_record.email_since, NOW()), _record.email);

            INSERT INTO historicaldb.user_login_history (login, valid)
            VALUES (_record.login, tsrange(_record.login_since, NOW()));

            DELETE FROM historicalDB.user_current WHERE login = _record.login;
      END IF;
      
      COMMIT;
END;
$$;

-- USER PROC REVIEW TASK

CREATE OR REPLACE PROCEDURE historicaldb.insert_review_task(_login VARCHAR, _id_task INT)
LANGUAGE plpgsql    
AS $$
BEGIN 
      INSERT INTO historicalDB.review_task_current (login, id_task, key_since) VALUES (_login, _id_task, NOW()) ON CONFLICT DO NOTHING;      
      COMMIT;
END;
$$;

CREATE OR REPLACE PROCEDURE historicaldb.delete_review_task(_login VARCHAR, id_task INT)
LANGUAGE plpgsql    
AS $$
DECLARE 
   _record RECORD;
BEGIN 
      SELECT INTO _record 
      login, id_task, key_since
      FROM historicalDB.review_task_current AS rtc
      WHERE rtc.login = _login AND rtc.id_task = _id_task;

      IF(_record IS NOT NULL) THEN
            INSERT INTO historicaldb.review_task_history (login, id_task, valid)
            VALUES (_record.login, _record.id_task, tsrange(_record.key_since, NOW()));
      END IF;

      COMMIT;
END;
$$;

-- USER PROC RESPONSIBLE TASK

CREATE OR REPLACE PROCEDURE historicaldb.insert_responsible_task(_login VARCHAR, _id_task INT)
LANGUAGE plpgsql    
AS $$
BEGIN 
      INSERT INTO historicalDB.responsible_task_current (login, id_task, key_since) VALUES (_login, _id_task, NOW()) ON CONFLICT DO NOTHING;      
      COMMIT;
END;
$$;

CREATE OR REPLACE PROCEDURE historicaldb.delete_responsible_task(_login VARCHAR, id_task INT)
LANGUAGE plpgsql    
AS $$
DECLARE 
   _record RECORD;
BEGIN 
      SELECT INTO _record 
      login, id_task, key_since
      FROM historicalDB.responsible_task_current AS rtc
      WHERE rtc.login = _login AND rtc.id_task = _id_task;

      IF(_record IS NOT NULL) THEN
            INSERT INTO historicaldb.responsible_task_history (login, id_task, valid)
            VALUES (_record.login, _record.id_task, tsrange(_record.key_since, NOW()));
      END IF;

      COMMIT;
END;
$$;

-- USER PROC ASSIGNED TASK

CREATE OR REPLACE PROCEDURE historicaldb.insert_assigned_task(_login VARCHAR, _id_task INT)
LANGUAGE plpgsql    
AS $$
BEGIN 
      INSERT INTO historicalDB.assigned_task_current (login, id_task, key_since) VALUES (_login, _id_task, NOW()) ON CONFLICT DO NOTHING;      
      COMMIT;
END;
$$;

CREATE OR REPLACE PROCEDURE historicaldb.delete_assigned_task(_login VARCHAR, id_task INT)
LANGUAGE plpgsql    
AS $$
DECLARE 
   _record RECORD;
BEGIN 
      SELECT INTO _record 
      login, id_task, key_since
      FROM historicalDB.assigned_task_current AS rtc
      WHERE rtc.login = _login AND rtc.id_task = _id_task;

      IF(_record IS NOT NULL) THEN
            INSERT INTO historicaldb.assigned_task_history (login, id_task, valid)
            VALUES (_record.login, _record.id_task, tsrange(_record.key_since, NOW()));
      END IF;

      COMMIT;
END;
$$;

-- WORK LOG PROC 
CREATE OR REPLACE PROCEDURE historicaldb.insert_work_log(_login VARCHAR, _id_work_log INTEGER, _description TEXT, _hour DOUBLE PRECISION)
LANGUAGE plpgsql
AS $$
BEGIN 
   INSERT INTO historicalDB.work_log_current 
   (login, id_work_log, description, hour, key_since, description_since, hour_since)
   VALUES (_login, _id_work_log, _description, _hour, _email, NOW(),NOW(),NOW())
   ON CONFLICT DO NOTHING;

   COMMIT;
END;
$$;

CREATE OR REPLACE PROCEDURE historicaldb.update_work_log(_id_work_log INTEGER, _description TEXT, _hour DOUBLE PRECISION)
LANGUAGE plpgsql    
AS $$
DECLARE 
   _record RECORD;
BEGIN 
      SELECT INTO _record 
      login, id_work_log, description, hour, description_since, hour_since
      FROM historicalDB.work_log_current AS wlc
      WHERE wlc.id_work_log = _id_work_log;
      
      IF(_record IS NOT NULL) THEN
            -- Handle historical db and current 
            IF(_description IS NOT NULL AND _record.description <> _description) THEN 
                  INSERT INTO historicaldb.work_log_description_history (login, id_work_log, valid, description)
                  VALUES (_record.login, _record.id_work_log, tsrange(_record.description_since, NOW()), _record.description);
                  UPDATE historicalDB.work_log_current SET description = _description, description_since = NOW() WHERE id_work_log = _record.id_work_log;
            END IF;
            IF(_hour IS NOT NULL AND _record.hour <> _hour) THEN 
                  INSERT INTO historicaldb.work_log_hour_history (login, id_work_log, valid, hour)
                  VALUES (_record.login, _record.id_work_log, tsrange(_record.hour_since, NOW()), _record.description);
                  UPDATE historicalDB.work_log_current SET hour = _hour, hour_since = NOW() WHERE id_work_log = _record.id_work_log;
            END IF;           
      END IF;
      COMMIT;
END;
$$;

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

CREATE OR REPLACE PROCEDURE historicaldb.delete_work_log(_id_work_log INTEGER)
LANGUAGE plpgsql    
AS $$
DECLARE 
   _record RECORD;
BEGIN 
      SELECT INTO _record 
      login, id_work_log, description, hour, key_since, description_since, hour_since 
      FROM historicalDB.work_log_current AS wlc
      WHERE wlc.id_work_log = _id_work_log;
      
      IF(_record IS NOT NULL) THEN
            INSERT INTO historicaldb.work_log_description_history (login, id_work_log, valid, description)
            VALUES (_record.login, tsrange(_record.surname_since, NOW()), _record.surname);      
      
            INSERT INTO historicaldb.work_log_hour_history (login, id_work_log, valid, hour)
            VALUES (_record.login, tsrange(_record.name_since, NOW()), _record.name);      
      
            INSERT INTO historicaldb.work_log_id_history (login, id_work_log, valid)
            VALUES (_record.login, tsrange(_record.password_since, NOW()), _record.password);      
            
            DELETE FROM historicalDB.work_log_current WHERE login = _record.login;
      END IF;
      
      COMMIT;
END;
$$;

-- WORK LOG PROC TASK
CREATE OR REPLACE PROCEDURE historicaldb.insert_work_log_task(_id_work_log INT, _id_task INT)
LANGUAGE plpgsql    
AS $$
BEGIN 
      INSERT INTO historicalDB.task_work_log_current (login, id_task, key_since) VALUES (_login, _id_task, NOW()) ON CONFLICT DO NOTHING;      
      COMMIT;
END;
$$;

CREATE OR REPLACE PROCEDURE historicaldb.delete_work_log_task(_id_work_log INT, _id_task INT)
LANGUAGE plpgsql    
AS $$
DECLARE 
   _record RECORD;
BEGIN 
      SELECT INTO _record 
      id_work_log, id_task, key_since
      FROM historicalDB.task_work_log_current AS twlc
      WHERE twlc.id_work_log = _id_work_log AND twlc.id_task = _id_task;

      IF(_record IS NOT NULL) THEN
            INSERT INTO historicaldb.task_work_log_history (id_work_log, id_task, valid)
            VALUES (_record.id_work_log, _record.id_task, tsrange(_record.key_since, NOW()));
      END IF;

      COMMIT;
END;
$$;
