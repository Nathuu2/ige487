CREATE OR REPLACE FUNCTION UpdateTaskLastModified()
    RETURNS TRIGGER AS
$BODY$
BEGIN
    UPDATE operationalDB.task
    SET last_modified = NOW()
    WHERE id_task = NEW.id_task;
 
    RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION UpdateProjectLastModified()
    RETURNS TRIGGER AS
$BODY$
BEGIN
    UPDATE operationalDB.project
    SET last_modified = NOW()
    WHERE id_project = NEW.id_project;
 
    RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;


------------------------ INSERT TRIGGERS ------------------------

------------ Every triggers related to operationalDB.task ------------

CREATE TRIGGER ontaskestimatedtimeinsert AFTER INSERT ON operationalDB.task_estimatedtime
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER ontaskstartdateinsert AFTER INSERT ON operationalDB.task_startdate
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER ontaskduedateinsert AFTER INSERT ON operationalDB.task_duedate
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER ontaskenddateinsert AFTER INSERT ON operationalDB.task_enddate
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER ontaskmilestoneinsert AFTER INSERT ON operationalDB.task_milestone
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER ontaskcommentinsert AFTER INSERT ON operationalDB.task_comment
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER onresponsibletaskinsert AFTER INSERT ON operationalDB.responsible_task
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER onreviewtaskinsert AFTER INSERT ON operationalDB.review_task
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

------------ Every triggers related to operationalDB.project_ ------------

CREATE TRIGGER onparticipateprojectinsert AFTER INSERT ON operationalDB.participate_project
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateProjectLastModified();

CREATE TRIGGER onprojectstartdateinsert AFTER INSERT ON operationalDB.project_startdate
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateProjectLastModified();

CREATE TRIGGER onprojectduedateinsert AFTER INSERT ON operationalDB.project_duedate
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateProjectLastModified();

CREATE TRIGGER onprojectenddateinsert AFTER INSERT ON operationalDB.project_enddate
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateProjectLastModified();

CREATE TRIGGER onprojectcommentinsert AFTER INSERT ON operationalDB.project_comment
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateProjectLastModified();

CREATE TRIGGER onprojecttaskinsert AFTER INSERT ON operationalDB.project_task
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateProjectLastModified();

------------------------ UPDATE TRIGGERS ------------------------

------------ Every triggers related to operationalDB.task_ ------------

CREATE TRIGGER ontaskestimatedtimeupdate AFTER UPDATE ON operationalDB.task_estimatedtime
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER ontaskstartdateupdate AFTER UPDATE ON operationalDB.task_startdate
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER ontaskduedateupdate AFTER UPDATE ON operationalDB.task_duedate
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER ontaskenddateupdate AFTER UPDATE ON operationalDB.task_enddate
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER ontaskmilestoneupdate AFTER UPDATE ON operationalDB.task_milestone
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER ontaskcommentupdate AFTER UPDATE ON operationalDB.task_comment
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER onresponsibletaskupdate AFTER UPDATE ON operationalDB.responsible_task
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER onreviewtaskupdate AFTER UPDATE ON operationalDB.review_task
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

------------ Every triggers related to operationalDB.project_ ------------

CREATE TRIGGER onparticipateprojectupdate AFTER UPDATE ON operationalDB.participate_project
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateProjectLastModified();

CREATE TRIGGER onprojectstartdateupdate AFTER UPDATE ON operationalDB.project_startdate
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateProjectLastModified();

CREATE TRIGGER onprojectduedateupdate AFTER UPDATE ON operationalDB.project_duedate
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateProjectLastModified();

CREATE TRIGGER onprojectenddateupdate AFTER UPDATE ON operationalDB.project_enddate
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateProjectLastModified();

CREATE TRIGGER onprojectcommentupdate AFTER UPDATE ON operationalDB.project_comment
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateProjectLastModified();

------------------------ DELETE TRIGGERS ------------------------

------------ Every triggers related to operationalDB.task_ ------------

CREATE TRIGGER ontaskestimatedtimedelete AFTER DELETE ON operationalDB.task_estimatedtime
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER ontaskstartdatedelete AFTER DELETE ON operationalDB.task_startdate
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER ontaskduedatedelete AFTER DELETE ON operationalDB.task_duedate
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER ontaskenddatedelete AFTER DELETE ON operationalDB.task_enddate
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER ontaskmilestonedelete AFTER DELETE ON operationalDB.task_milestone
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER ontaskcommentdelete AFTER DELETE ON operationalDB.task_comment
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER onresponsibletaskdelete AFTER DELETE ON operationalDB.responsible_task
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();

CREATE TRIGGER onreviewtaskdelete AFTER DELETE ON operationalDB.review_task
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateTaskLastModified();    

------------ Every triggers related to operationalDB.project_ ------------

CREATE TRIGGER onparticipateprojectdelete AFTER DELETE ON operationalDB.participate_project
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateProjectLastModified();

CREATE TRIGGER onprojectstartdatedelete AFTER DELETE ON operationalDB.project_startdate
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateProjectLastModified();

CREATE TRIGGER onprojectduedatedelete AFTER DELETE ON operationalDB.project_duedate
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateProjectLastModified();

CREATE TRIGGER onprojectenddatedelete AFTER DELETE ON operationalDB.project_enddate
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateProjectLastModified();

CREATE TRIGGER onprojectcommentdelete AFTER DELETE ON operationalDB.project_comment
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateProjectLastModified();

CREATE TRIGGER onprojecttaskdelete AFTER DELETE ON operationalDB.project_task
    FOR EACH ROW        
    EXECUTE PROCEDURE UpdateProjectLastModified();