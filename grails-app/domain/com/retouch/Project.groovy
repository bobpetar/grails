package com.retouch

class Project {
    User assignedTo
    User client
    String note
    Date createdDate
    Date lastUpdated
    String status
    String projectId

    static hasOne = [task:Task]

    static constraints = {
        status(nullable: false,blank:false,inList: ["New","Complete","Paid","In Progress","In Review"])
        assignedTo(nullable:true,blank:true)
        note(nullable:true,blank:true, maxSize: 2000)
        client(nullable:false,blank:false)
        projectId(nullable: false,blank: false,unique: true)
    }

    def beforeUpdate() {
        lastUpdated = new Date()
    }

    def beforeValidate() {
        if (id == null) {
            createdDate = new Date()
            lastUpdated = new Date()
            status = "New"
        }
    }

    def static generateProjectId(){
        return (new Date()).time.toString()
    }


}
