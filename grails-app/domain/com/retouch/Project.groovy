package com.retouch

class Project {
    User assignedTo
    User createdBy
    String note
    Date createdDate
    Date lastUpdated
    String status

    static constraints = {
        assignedTo(nullable:true,blank:true)
        createdBy(nullable:true,blank:true)
    }
}
