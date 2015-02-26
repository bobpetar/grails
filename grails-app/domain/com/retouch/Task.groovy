package com.retouch

class Task {
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
