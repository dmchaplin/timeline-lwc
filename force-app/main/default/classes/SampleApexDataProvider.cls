/*
 *  Copyright (c) 2018, salesforce.com, inc.
 *  All rights reserved.
 *  SPDX-License-Identifier: BSD-3-Clause
 *  For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 */

global class SampleApexDataProvider extends AbstractTimelineDataProvider {



    global override String getObjectName(){

        return 'Task';

    }

    global override String getRelationshipName(){

        return 'OpenTasks';

    }

 

    global override String getTitleField(){

        return 'Subject';

    }

    global override String getDateField(){

        return 'CreatedDate';

    }

    global override List<String> getFieldsToDisplay(){

        return new List<String>{'Subject','CreatedDate'};

    }

 

    global override List<TimelineFieldType> getFieldsToDisplayWithTypes(){

        List<TimelineFieldType> fieldTypes= new List<TimelineFieldType>();

        fieldTypes.add(TimelineFieldType.newInstance('Subject','Subject',Schema.DisplayType.String));

        fieldTypes.add(TimelineFieldType.newInstance('Created Date','CreatedDate',Schema.DisplayType.String));

        return fieldTypes;

    }

    global override String getBaseUrlForRecordDetail(){

        return '';

    }

 

    global override String getRecordIdentifierField(){

        return 'Id';

    }

 

    global override List<Object> getData(Id recordId,String dateFilter){

        List<Object> result = new List<Object>();

        //Id recordtypeId = '';

        String fields = 'Subject, CreatedDate';

        for ( Task item:[select Id,Subject, CreatedDate,OwnerId,ActivityDate,Description,IsClosed,WhoId,Owner.Name,Who.Name from task where whatId=:recordId ]) {

            Map<String,Object> obj = new Map<String,Object>();

            obj.put('Id',item.Id);

            obj.put('Subject',item.Subject);
           

            obj.put('CreatedDate',item.CreatedDate.format());
            obj.put('ActivityDate',item.ActivityDate);
            obj.put('IsClosed',item.IsClosed);
            obj.put('WhoId',item.WhoId);
            Map<String,String> nameMap = new Map<String,String>();
            nameMap.put('Name',item.Owner.Name);
            obj.put('Owner',nameMap);
             nameMap = new Map<String,String>();
            nameMap.put('Name',item.Who.Name);
            obj.put('Who',nameMap);

            result.add(obj);
        }

        return result;

    }

 

    global override Boolean isSalesforceObject(){

        return true;

    }

 

    global override Boolean isUiApiNotSupported(){

        return true;

    }
    
   /* global override String getObjectName(){
        return 'Case';
    }
    global override String getRelationshipName(){
        return 'OpenCases';
    }

    global override String getTitleField(){
        return 'Subject';
    }
    global override String getDateField(){
        return 'CreatedDate';
    }
    global override List<String> getFieldsToDisplay(){
        return new List<String>{'Subject','CreatedDate','CreatedById','OwnerId','Status','ClosedDate'};
    }

    global override List<timeline.TimelineFieldType> getFieldsToDisplayWithTypes(){
        List<timeline.TimelineFieldType> fieldTypes= new List<timeline.TimelineFieldType>();
        fieldTypes.add(timeline.TimelineFieldType.newInstance('Subject','Subject',Schema.DisplayType.String));
        fieldTypes.add(timeline.TimelineFieldType.newInstance('Created Date','CreatedDate',Schema.DisplayType.String));
        fieldTypes.add(timeline.TimelineFieldType.newInstance('Created By','CreatedById',Schema.DisplayType.String));
        fieldTypes.add(timeline.TimelineFieldType.newInstance('Owner','OwnerId',Schema.DisplayType.String));
        fieldTypes.add(timeline.TimelineFieldType.newInstance('Status','Status',Schema.DisplayType.String));
        fieldTypes.add(timeline.TimelineFieldType.newInstance('Date/Time Closed','ClosedDate',Schema.DisplayType.String));
        return fieldTypes;
    }
    global override String getBaseUrlForRecordDetail(){
        return '';
    }

    global override String getRecordIdentifierField(){
        return 'Id';
    }

    global override List<Object> getData(Id recordId,String dateFilter){
        List<Object> result = new List<Object>();
        //Id recordtypeId = '';
        String fields = 'Subject, CreatedById, Owner.Name, Status, ClosedDate, CreatedDate';
        for ( Case item:[select Id,Subject, CreatedBy.Name, Owner.Name, Status, ClosedDate, CreatedDate from Case where AccountId=:recordId and Status !='Closed' ]) {
            Map<String,Object> obj = new Map<String,Object>();
            obj.put('Id',item.Id);
            obj.put('Subject',item.Subject);
            obj.put('CreatedDate',item.CreatedDate.format());
            obj.put('CreatedById',item.CreatedBy.Name);
            obj.put('OwnerId',item.Owner.Name);
            obj.put('Status',item.Status);
            if ( item.ClosedDate !=null ) {
                obj.put('ClosedDate',item.ClosedDate.format());
            } else {
                obj.put('ClosedDate','');
            }
            result.add(obj);
        }
        return result;
    }

    global override Boolean isSalesforceObject(){
        return true;
    }

    global override Boolean isUiApiNotSupported(){
        return false;
    }
    */  

    /*
    
    global override String getObjectName(){

        return 'RichTextApex';

    }

    global override String getRelationshipName(){

        return 'RichTextApex';

    }

 

    global override String getTitleField(){

        return 'Subject';

    }

    global override String getDateField(){

        return 'CreatedDate';

    }

    global override List<String> getFieldsToDisplay(){

        return new List<String>{'Subject','CreatedDate','Description'};

    }

 

    global override List<timeline.TimelineFieldType> getFieldsToDisplayWithTypes(){

        List<timeline.TimelineFieldType> fieldTypes= new List<timeline.TimelineFieldType>();

        fieldTypes.add(timeline.TimelineFieldType.newInstance('Subject','Subject',Schema.DisplayType.String));

        fieldTypes.add(timeline.TimelineFieldType.newInstance('Created Date','CreatedDate',Schema.DisplayType.String));
        fieldTypes.add(timeline.TimelineFieldType.newInstance('Description','Description','RICHTEXTAREA'));

        return fieldTypes;

    }

    global override String getBaseUrlForRecordDetail(){

        return '';

    }

 

    global override String getRecordIdentifierField(){

        return 'Id';

    }

 

    global override List<Object> getData(Id recordId,String dateFilter){

        List<Object> result = new List<Object>();
        Map<String,Object> obj = new Map<String,Object>();
        obj.put('Subject','Something');
        obj.put('Description','<p><b>BOld</b></p>');
        obj.put('CreatedDate',System.now());
        result.add(obj);
        return result;

    }

 

    global override Boolean isSalesforceObject(){

        return false;

    }

 

    global override Boolean isUiApiNotSupported(){

        return true;

    }*/
}