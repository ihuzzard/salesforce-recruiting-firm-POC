public class JobApplicationDomain implements ITriggerHandler {

    // The core logic for this requirement runs BEFORE INSERT
    public void beforeInsert(List<SObject> newRecords) {
        // Cast the generic SObject list to the specific object type
        List<Job_Application__c> applications = (List<Job_Application__c>) newRecords;

        // Call the service layer method to enforce the limit
        JobApplicationService.checkActiveApplicationLimit(applications);
    }

    // -----------------------------------------------------------
    // EMPTY METHODS (Required by Interface, but not needed for this requirement)
    // -----------------------------------------------------------
    public void beforeUpdate(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
    public void beforeDelete(Map<Id, SObject> oldMap) {}
    public void afterInsert(Map<Id, SObject> newMap) {}
    public void afterUpdate(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
    public void afterDelete(Map<Id, SObject> oldMap) {}
    public void afterUndelete(Map<Id, SObject> newMap) {}
}