package com.retouch

class Project {
    User assignedTo
    User client
    String note
    Date createdDate
    Date lastUpdated
    String status
    String projectId
/*    ReImage originalImage
    ReImage finalImage*/

    static hasOne = [task:Task]

    static constraints = {
        assignedTo(nullable:true,blank:true)
        note(nullable:true,blank:true, maxSize: 2000)
        client(nullable:false,blank:false)
        projectId(nullable: false,blank: false,unique: true)
/*        originalImage(nullable: false,blank: false)
        finalImage(nullable: true,blank: true)*/
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
