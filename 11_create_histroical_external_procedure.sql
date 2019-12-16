-- Ce shéma sert essentiellement a fournir les fonctionnalités à l'exterieur de la base de donnée.
-- Le flow des données y est spécifié
CREATE OR REPLACE PROCEDURE historicalexternal.insert_user(_login VARCHAR, _surname VARCHAR, _name VARCHAR, _password CHAR(64), _email VARCHAR)
LANGUAGE plpgsql    
AS $$
BEGIN 
  CALL historicaldb.insert_user(_login, _surname, _name, _password, _email)
END;
$$;

CREATE OR REPLACE PROCEDURE historicalexternal.update_user(_login VARCHAR, _surname VARCHAR, _name VARCHAR, _password CHAR(64), _email VARCHAR)
LANGUAGE plpgsql    
AS $$  
BEGIN 
    CALL historicaldb.update_user(_login, _surname, _name, _password, _email);
END;
$$;

CREATE OR REPLACE PROCEDURE historicalexternal.delete_user(_login VARCHAR)
LANGUAGE plpgsql    
AS $$
DECLARE
    _task_ids INTEGER[];
BEGIN 
    _task_ids := ARRAY(
                    SELECT id_task
                    FROM historicalDB.review_task_current AS rtc
                    WHERE rtc.login = _login 
                    );
    for id IN SELECT _task_ids
    LOOP
        CALL historicaldb.delete_review_task(_login, id);
    END LOOP;
    
    _task_ids := ARRAY(
                    SELECT id_task
                    FROM historicalDB.responsible_task_current AS rtc
                    WHERE rtc.login = _login 
                    );
    for id IN SELECT _task_ids
    LOOP
        CALL historicaldb.delete_responsible_task(_login, id);
    END LOOP;

    _task_ids := ARRAY(
                    SELECT id_task
                    FROM historicalDB.assigned_task_current AS rtc
                    WHERE rtc.login = _login 
                    );
    for id IN SELECT _task_ids
    LOOP
        CALL historicaldb.delete_assigned_task(_login, id);
    END LOOP;

    CALL historicaldb.delete_user(_login);
END;
$$;

-- USER PROC REVIEW TASK

CREATE OR REPLACE PROCEDURE historicaldb.insert_review_task(_login VARCHAR, _id_task INT)
LANGUAGE plpgsql    
AS $$
BEGIN 
    CALL historicaldb.insert_review_task
END;
$$;

CREATE OR REPLACE PROCEDURE historicaldb.delete_review_task(_login VARCHAR, id_task INT)
LANGUAGE plpgsql    
AS $$
BEGIN 
    CALL historicaldb.delete_review_task
END;
$$;

-- USER PROC RESPONSIBLE TASK

CREATE OR REPLACE PROCEDURE historicaldb.insert_responsible_task(_login VARCHAR, _id_task INT)
LANGUAGE plpgsql    
AS $$
BEGIN 
    CALL historicaldb.insert_responsible_task
END;
$$;

CREATE OR REPLACE PROCEDURE historicaldb.delete_responsible_task(_login VARCHAR, id_task INT)
LANGUAGE plpgsql    
AS $$
BEGIN 
    CALL historicaldb.delete_responsible_task
END;
$$;

-- USER PROC ASSIGNED TASK

CREATE OR REPLACE PROCEDURE historicaldb.insert_assigned_task(_login VARCHAR, _id_task INT)
LANGUAGE plpgsql    
AS $$
BEGIN 
    CALL historicaldb.insert_assigned_task
END;
$$;

CREATE OR REPLACE PROCEDURE historicaldb.delete_assigned_task(_login VARCHAR, id_task INT)
LANGUAGE plpgsql    
AS $$
BEGIN 
    CALL historicaldb.delete_assigned_task
END;
$$;
